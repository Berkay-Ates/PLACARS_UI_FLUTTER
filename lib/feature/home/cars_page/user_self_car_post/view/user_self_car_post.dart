// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:placars_savt/feature/home/home_page/model/car_home_post_model.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/placars_button_widget.dart';
import '../../../../../core/components/placars_icon_button.dart';
import '../../../../../core/init/theme/itheme/iTheme.dart';
import '../../../home_page/car_post_detail_page/view/car_post_detail_view.dart';
import '../view_model/user_self_car_post_view_model.dart';

class UserSelfCarPostView extends StatelessWidget {
  const UserSelfCarPostView({super.key, this.cars});

  final Cars? cars;
  @override
  Widget build(BuildContext context) {
    return BaseView<UserSelfCarPostViewModel>(
        viewModel: UserSelfCarPostViewModel(),
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
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  cars?.carPlate ?? "noplate",
                  style: ITheme.of(context).headlineMedium,
                ),
                actions: const [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.96,
                      decoration: BoxDecoration(
                        color: ITheme.of(context).secondaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x230F1113),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                    color: ITheme.of(context).lineColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60.0),
                                      child: Image.network(
                                        cars?.profile_img_url ??
                                            "https://images.unsplash.com/photo-1611590027211-b954fd027b51?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60",
                                        width: 80.0,
                                        height: 80.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cars?.carPlate ?? "no plate" /* 34KYC128 */,
                                        style: ITheme.of(context).headlineSmall,
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                        child: Text(
                                          cars?.carBrand ?? "nobrand" /* AUDI A6 2021 */,
                                          style: ITheme.of(context).bodyMedium.copyWith(
                                                fontFamily: 'Lexend',
                                                color: ITheme.of(context).primary,
                                              ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              "${cars?.carKm} KM" /* 18500KM */,
                                              style: ITheme.of(context).bodyMedium.copyWith(
                                                    fontFamily: 'Lexend',
                                                    color: ITheme.of(context).secondaryText,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                          child: Container(
                                            height: 32.0,
                                            constraints: const BoxConstraints(
                                              maxHeight: 32.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ITheme.of(context).tertiary,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x32171717),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.circular(30.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                    child: Text(
                                                      (cars?.isCarSale ?? false)
                                                          ? "Satilik"
                                                          : "Satilik Değil" /* Satılık */,
                                                      style: ITheme.of(context).bodyMedium.copyWith(
                                                            fontFamily: 'Lexend',
                                                            color: ITheme.of(context).primaryBtnText,
                                                          ),
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.radio_button_checked_outlined,
                                                    color: Colors.white,
                                                    size: 12.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            height: 32.0,
                                            constraints: const BoxConstraints(
                                              maxHeight: 32.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ITheme.of(context).alternate,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x32171717),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'TAKİP ET' /* Takip Et */,
                                                    style: ITheme.of(context).bodyMedium.copyWith(
                                                          fontFamily: 'Lexend',
                                                          color: ITheme.of(context).primaryBtnText,
                                                        ),
                                                  ),
                                                ],
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      cars?.carOwnerEmail ?? "noMail" /* Arabam Dacia Yapıyorum Çift Ka... */,
                                      style: ITheme.of(context).bodySmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 6.0),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 8.0),
                                  child: PlacarsButtonWidget(
                                    onPressed: () {
                                      viewModel.navigateToChatScreen(cars);
                                      // try {
                                      //   if ((viewModel.userHiveModel?.email?.isNotEmpty ?? false) &&
                                      //       (viewModel.userHiveModel?.profileImgUrl?.isNotEmpty ?? false)) {
                                      //     await viewModel.addRecentlyMessaged(cars);
                                      //   } else {
                                      //     viewModel.showSnackS();
                                      //   }
                                      // } catch (e) {
                                      //   inspect(e);
                                      //   viewModel.showSnackS();
                                      // }
                                    },
                                    text: 'Mesaj At',
                                    options: PlacarsButtonOptions(
                                      width: 100.0,
                                      height: 30.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                      color: ITheme.of(context).primary,
                                      textStyle: ITheme.of(context).titleSmall.copyWith(
                                            fontFamily: 'Lexend',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                      elevation: 2.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Plakanın Gönderileri' /* Plakanın Gönderileri */,
                            style: ITheme.of(context).bodyLarge.copyWith(
                                  fontFamily: 'Lexend',
                                  color: ITheme.of(context).primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 12.0, 10.0, 0.0),
                      child: CarWidget(
                        plate: cars?.carPlate,
                        date: viewModel.tarihiDuzenle(cars?.postDate ?? "2023-05-17T06:11:05.453916Z"),
                        ownerUrl: cars?.profile_img_url,
                        carUrl: cars?.carPhotoUrl,
                        description: cars?.carDescription,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Plaka Yorumları' /*  */,
                            style: ITheme.of(context).bodyLarge.copyWith(
                                  fontFamily: 'Lexend',
                                  color: ITheme.of(context).primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: viewModel.firestore
                            .collection(cars?.carPlate ?? "")
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
                        })
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class CarWidget extends StatelessWidget {
  const CarWidget({
    Key? key,
    this.plate,
    this.ownerUrl,
    this.carUrl,
    this.date,
    this.description,
  }) : super(key: key);

  final String? plate;
  final String? ownerUrl;
  final String? carUrl;
  final String? date;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 6.0),
      child: InkWell(
        onTap: () async {
          //context.pushNamed('post');
        },
        child: Container(
          height: 300.0,
          decoration: BoxDecoration(
            color: ITheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 36.0,
                        height: 36.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          ownerUrl ?? 'https://picsum.photos/seed/547/600',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          plate ?? '5fbw4qpt' /* 34 ATC 48 */,
                          style: ITheme.of(context).bodyMedium.copyWith(
                                fontFamily: 'Lexend',
                                fontSize: 20.0,
                              ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                        child: Text(
                          date ?? 'ma6o8eic' /* 1 gün önce */,
                          textAlign: TextAlign.end,
                          style: ITheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    carUrl ?? 'https://cdn.motor1.com/images/mgl/nAZYlR/s1/tesla-model-y.webp',
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: AutoSizeText(
                        description ?? "Bugün ilk arabamı aldım. İlk a...",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: ITheme.of(context).bodyMedium.copyWith(
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
