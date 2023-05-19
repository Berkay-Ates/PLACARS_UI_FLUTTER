// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:placars_savt/core/extension/easy_localization_translate/easy_localization_translate.dart';
import 'package:placars_savt/core/init/lang/locale_keys.g.dart';
import 'package:placars_savt/feature/home/home_page/notifications_page/view_model/notifications_view_model.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/notifications_info_widget.dart';
import '../../../../../core/components/placars_icon_button.dart';
import '../../../../../core/init/theme/itheme/iTheme.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationsViewModel>(
        viewModel: NotificationsViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (context, viewModel) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(viewModel.unfocusNode),
            child: Scaffold(
              key: viewModel.scaffoldKey,
              backgroundColor: ITheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: ITheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: PlacarsIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    color: ITheme.of(context).secondaryText,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  LocaleKeys.notifications_page_appbar.translate,
                  style: ITheme.of(context).headlineMedium,
                ),
                actions: const [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const NotificationInfoWidget(plate: "34 YZ 56", date: "5 ay once");
                },
              ),
            ),
          );
        });
  }
}
