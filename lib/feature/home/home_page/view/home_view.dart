import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../view_model/home_view_model.dart';
import '../../../../product/enums/home_post_enums.dart';

import '../../../../core/components/placars_car_post_widget.dart';
import '../../../../core/components/placars_icon_button.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';
import '../notifications_page/view/notifications_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: HomeViewModel(),
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
                title: Text(
                  LocaleKeys.home_page_app_name.translate,
                  style: ITheme.of(context)
                      .headlineMedium
                      .copyWith(fontFamily: 'Lexend', color: ITheme.of(context).primaryText),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: PlacarsIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.notifications_none,
                        color: ITheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsView()));
                      },
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: TextFormField(
                      controller: viewModel.textController,
                      onChanged: null,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: LocaleKeys.home_page_search.translate,
                        labelStyle: ITheme.of(context).bodySmall,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: ITheme.of(context).secondaryBackground,
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: ITheme.of(context).secondaryText,
                        ),
                      ),
                      style: ITheme.of(context).bodyMedium,
                      maxLines: 1,
                      validator: null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: Observer(builder: (_) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                            child: InkWell(
                              onTap: () => viewModel.changePostCategory(HomePostEnums.interestings),
                              child: Text(
                                LocaleKeys.home_page_interesting.translate,
                                style: ITheme.of(context).titleSmall.copyWith(
                                      fontFamily: 'Lexend',
                                      color: viewModel.selectedPostCatgry == HomePostEnums.interestings
                                          ? ITheme.of(context).primaryText
                                          : ITheme.of(context).secondaryText,
                                      fontSize: 14.0,
                                    ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GestureDetector(
                                onTap: () => viewModel.changePostCategory(HomePostEnums.newest),
                                child: Text(
                                  LocaleKeys.home_page_news.translate,
                                  style: ITheme.of(context).bodyMedium.copyWith(
                                        fontFamily: 'Lexend',
                                        color: viewModel.selectedPostCatgry == HomePostEnums.newest
                                            ? ITheme.of(context).primaryText
                                            : ITheme.of(context).secondaryText,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => viewModel.changePostCategory(HomePostEnums.popular),
                            child: Text(
                              LocaleKeys.home_page_liked.translate,
                              style: ITheme.of(context).bodyMedium.copyWith(
                                    fontFamily: 'Lexend',
                                    color: viewModel.selectedPostCatgry == HomePostEnums.popular
                                        ? ITheme.of(context).primaryText
                                        : ITheme.of(context).secondaryText,
                                  ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Observer(builder: (_) {
                        return viewModel.isloading
                            ? const Center(child: CircularProgressIndicator())
                            : viewModel.carLists.isEmpty
                                ? Center(
                                    child: Text(
                                      LocaleKeys.home_page_no_car_warn_txt.translate,
                                      textAlign: TextAlign.center,
                                      style: ITheme.of(context).headlineSmall,
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: viewModel.selectedPostCatgry == HomePostEnums.interestings
                                        ? viewModel.carLists.length
                                        : viewModel.selectedPostCatgry == HomePostEnums.newest
                                            ? viewModel.carLists.length
                                            : viewModel.carLists.length,
                                    padding: const EdgeInsets.only(bottom: 120),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return PlacarsCarPostsWidget(
                                        userImageUrl: viewModel.carLists[index].profile_img_url ??
                                            'https://images.unsplash.com/photo-1611590027211-b954fd027b51?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                        carPlate: viewModel.carLists[index].carPlate ?? '34 ATC 48',
                                        timePosted: viewModel.tarihiDuzenle(
                                            viewModel.carLists[index].postDate ?? "2023-05-17T06:11:05.453916Z"),
                                        postImageUrl: viewModel.carLists[index].carPhotoUrl ??
                                            'https://hips.hearstapps.com/hmg-prod/images/2023-tesla-model-x-101-1671475309.jpeg?crop=0.402xw:0.362xh;0.381xw,0.295xh&resize=2048:*',
                                        postDescription: viewModel.carLists[index].carDescription ??
                                            'bu bir test metnidir bu bu bir test metnidir bu ir bu bir test metnidir bu bir test metnidir',
                                        commentCount: viewModel.carLists[index].carLikeCount ?? 0,
                                        likeCount: viewModel.carLists[index].carCommentCount ?? 0,
                                        onTop: () => viewModel.navigateToCarPostView(viewModel.carLists[index]),
                                      );
                                    },
                                  );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        onDispose: (viewModel) => viewModel.dispose());
  }
}
