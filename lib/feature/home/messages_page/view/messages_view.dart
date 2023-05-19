// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:placars_savt/core/base/view/base_view.dart';
import 'package:placars_savt/core/extension/easy_localization_translate/easy_localization_translate.dart';
import 'package:placars_savt/core/init/lang/locale_keys.g.dart';
import 'package:placars_savt/feature/home/messages_page/view_model/messages_view_model.dart';

import '../../../../core/components/messages_preview_widget.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<MessagesViewModel>(
        viewModel: MessagesViewModel(),
        onModelReady: ((viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        }),
        onPageBuilder: (context, viewModel) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(viewModel.unfocusNode),
            child: Scaffold(
              key: viewModel.scaffoldKey,
              backgroundColor: ITheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: ITheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  LocaleKeys.messages_appbar.translate,
                  style: ITheme.of(context).headlineMedium,
                ),
                actions: const [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Observer(builder: (_) {
                    return viewModel.isLoading
                        ? const Expanded(child: Center(child: CircularProgressIndicator()))
                        : viewModel.recentlyMessged.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 300),
                                  SizedBox(
                                    height: 300,
                                    child: Text(LocaleKeys.messages_no_messaged_person.translate,
                                        style: ITheme.of(context).headlineSmall, textAlign: TextAlign.center),
                                  ),
                                ],
                              )
                            : Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 120),
                                  itemCount: viewModel.recentlyMessged.length,
                                  itemBuilder: (context, index) {
                                    if (viewModel.recentlyMessged[index].displayQrData != null) {
                                      return MessagePreviewWidget(
                                        onTap: () => viewModel.navigateToChat(
                                            viewModel.recentlyMessged[index].displayQrData ?? "PLACARS"),
                                        imgUrl: viewModel.recentlyMessged[index].profile_img_url ??
                                            'https://images.unsplash.com/photo-1531123414780-f74242c2b052?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                        userName: viewModel.recentlyMessged[index].displayQrData ?? "PLACARS",
                                        previousMessage: "Onceki mesajlar sonra gozukecek.",
                                      );
                                    }
                                    return null;
                                  },
                                  scrollDirection: Axis.vertical,
                                ),
                              );
                  }),
                ],
              ),
            ),
          );
        });
  }
}
