// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:placars_savt/core/extension/easy_localization_translate/easy_localization_translate.dart';
import 'package:placars_savt/core/init/lang/locale_keys.g.dart';
import 'package:placars_savt/feature/home/cars_page/user_self_car_post/view/user_self_car_post.dart';
import 'package:placars_savt/feature/home/home_page/car_post_detail_page/view_model/car_post_detail_view_model.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/placars_icon_button.dart';
import '../../../../../core/init/theme/itheme/iTheme.dart';
import '../../model/car_home_post_model.dart';

class CarPostDetailView extends StatelessWidget {
  final Cars? cars;

  const CarPostDetailView({super.key, this.cars});
  @override
  Widget build(BuildContext context) {
    return BaseView<CarPostDetailViewModel>(
      viewModel: CarPostDetailViewModel(),
      onModelReady: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
      },
      onPageBuilder: (context, viewModel) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(viewModel.unfocusNode),
          child: Scaffold(
            key: viewModel.scaffoldKey,
            backgroundColor: ITheme.of(context).secondaryBackground,
            appBar: AppBar(
              title: Text(
                cars?.carPlate ?? '34 ABC 239',
                style: ITheme.of(context).headlineMedium.copyWith(
                      fontFamily: 'Lexend',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              backgroundColor: ITheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: PlacarsIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: ITheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => UserSelfCarPostView(cars: cars)));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.network(
                                  cars?.profile_img_url ??
                                      'https://images.unsplash.com/photo-1611590027211-b954fd027b51?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                  width: 40.0,
                                  height: 40.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cars?.carPlate ?? '34 ABC 239',
                                        style: ITheme.of(context).bodyMedium,
                                      ),
                                      Text(
                                        viewModel.tarihiDuzenle(cars?.postDate ?? "2023-05-17T06:11:05.453916Z"),
                                        style: ITheme.of(context).bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              cars?.carPhotoUrl ??
                                  'https://hips.hearstapps.com/hmg-prod/images/2023-tesla-model-x-101-1671475309.jpeg?crop=0.402xw:0.362xh;0.381xw,0.295xh&resize=2048:*',
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                          child: Text(
                            cars?.carDescription ?? 'Arabanın tanımlaması burada yazılı',
                            style: ITheme.of(context).bodySmall,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.favorite_border,
                                color: ITheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "${cars?.carCommentCount} ${LocaleKeys.car_post_detail_like.translate}",
                                  style: ITheme.of(context).bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.mode_comment_outlined,
                                  color: ITheme.of(context).secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "${cars?.carLikeCount} ${LocaleKeys.car_post_detail_comment.translate}",
                                  style: ITheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: viewModel.firestore
                                .collection(cars?.carPlate ?? '34 ABC 239')
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
                                        return CarPostChatBubbleWidget(
                                            message: documents?[index].get("text"),
                                            sender: viewModel.userHiveModel?.email == documents?[index].get("sender")
                                                ? "Sen"
                                                : documents?[index].get("sender"),
                                            datePosted: viewModel.formatDate(documents?[index].get("timestamp")),
                                            imageUrl: documents?[index].get("sender_image_url"));
                                      }),
                                );
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: ITheme.of(context).primaryBackground,
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
                                              await viewModel.sendMessage(message, cars?.carPlate ?? '34 ABC 239');
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
                ),
              ],
            ),
          ),
        );
      },
      onDispose: (viewModel) => viewModel.dispose(),
    );
  }
}

class CarPostChatBubbleWidget extends StatelessWidget {
  const CarPostChatBubbleWidget({
    Key? key,
    required this.message,
    required this.sender,
    required this.datePosted,
    required this.imageUrl,
  }) : super(key: key);

  final String message;
  final String sender;
  final String datePosted;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.network(
              imageUrl,
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  decoration: BoxDecoration(
                    color: ITheme.of(context).alternate,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sender,
                          style: ITheme.of(context).bodyMedium,
                        ),
                        Text(
                          message,
                          style: ITheme.of(context).bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, .0, 0.0, 0.0),
                child: Text(
                  datePosted,
                  style: ITheme.of(context).bodySmall.copyWith(fontSize: 11),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
