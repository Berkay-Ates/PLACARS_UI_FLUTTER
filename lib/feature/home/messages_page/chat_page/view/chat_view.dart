// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/message_receiver_bubble_widget.dart';
import '../../../../../core/components/message_sender_bubble_widget.dart';
import '../../../../../core/components/placars_icon_button.dart';
import '../../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../core/init/theme/itheme/iTheme.dart';
import '../view_model/chat_view_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    Key? key,
    required this.chattingPlate,
  }) : super(key: key);
  final String chattingPlate;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      viewModel: ChatViewModel(),
      onModelReady: (viewModel) async {
        viewModel.setContext(context);
        viewModel.init();
        viewModel.setChattingEmail(chattingPlate);
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
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: ITheme.of(context).secondaryText,
                  size: 30,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                chattingPlate,
                style: ITheme.of(context).headlineMedium.copyWith(
                      fontFamily: 'Lexend',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2,
            ),
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: viewModel.firestore
                          .collection(chattingPlate)
                          .orderBy('timestamp', descending: true)
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return const Expanded(child: Center(child: CircularProgressIndicator()));
                        }
                        final List<QueryDocumentSnapshot<Object?>>? documents = snapshot.data?.docs;
                        return Observer(builder: (_) {
                          return Expanded(
                            child: ListView.builder(
                                reverse: true,
                                controller: viewModel.controller,
                                padding: const EdgeInsets.only(bottom: 20),
                                itemCount: documents?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return documents?[index].get("sender") == viewModel.userHiveModel?.email
                                      ? ReceiverMessageBubbleWidget(
                                          sender: documents?[index].get("sender"),
                                          imageUrl: documents?[index].get("sender_image_url"),
                                          datePosted: viewModel.formatDate(documents?[index].get("timestamp")),
                                          message: documents?[index].get("text"),
                                        )
                                      : SenderMessageBuble(
                                          sender: documents?[index].get("sender"),
                                          imageUrl: documents?[index].get("sender_image_url"),
                                          datePosted: viewModel.formatDate(documents?[index].get("timestamp")),
                                          message: documents?[index].get("text"),
                                        );
                                }),
                          );
                        });
                      }),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Container(
                          width: 198,
                          height: 0,
                          decoration: BoxDecoration(
                            color: ITheme.of(context).secondaryBackground,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: ITheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: TextField(
                                controller: viewModel.textController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  suffixIcon: Observer(builder: (_) {
                                    return IconButton(
                                      onPressed: viewModel.isloading
                                          ? () {}
                                          : () async {
                                              viewModel.changeLoading();
                                              final message = viewModel.textController?.text;
                                              viewModel.textController?.clear();
                                              await viewModel.sendMessage(message);
                                              viewModel.changeLoading();
                                              viewModel.scrollToBottom();
                                            },
                                      icon: Icon(
                                        Icons.send,
                                        color: ITheme.of(context).primaryText,
                                        size: 15,
                                      ),
                                    );
                                  }),
                                  hintText: LocaleKeys.chat_view_chat_info.translate,
                                ),
                                style: ITheme.of(context).bodyMedium.copyWith(
                                      fontFamily: 'Lexend',
                                      fontSize: 12,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      onDispose: (viewModel) => viewModel.dispose(),
    );
  }
}
