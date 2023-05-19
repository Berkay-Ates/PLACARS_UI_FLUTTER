// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:placars_savt/core/extension/easy_localization_translate/easy_localization_translate.dart';
import 'package:placars_savt/core/init/lang/locale_keys.g.dart';

import 'package:placars_savt/feature/home/tab_page/view_model.dart/tab_view_model.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/floating_navigation_bar.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';
import '../../../../product/enums/tab_enums.dart';

class PlacarsTabView extends StatefulWidget {
  const PlacarsTabView({Key? key, this.initialPage, this.page}) : super(key: key);

  final TabEnums? initialPage;
  final Widget? page;

  @override
  State<PlacarsTabView> createState() => _PlacarsTabViewState();
}

class _PlacarsTabViewState extends State<PlacarsTabView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<PlacarsTabViewModel>(
        viewModel: PlacarsTabViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
          viewModel.setCurrentPageIndex(viewModel.tabs.keys.toList().indexOf(viewModel.currentPageName));
          viewModel.tabController = TabController(length: TabEnums.values.length, vsync: this);
          if (widget.initialPage != null) {
            viewModel.currentPageName = widget.initialPage.toString();
          }
          viewModel.currentPage = widget.page;
        },
        onPageBuilder: (context, viewModel) {
          return Observer(builder: (_) {
            return Scaffold(
              body: viewModel.currentPage ?? viewModel.tabs[viewModel.currentPageName],
              extendBody: true,
              bottomNavigationBar: FloatingNavbar(
                currentIndex: viewModel.currentIndex,
                onTap: (i) {
                  viewModel.currentPage = null;
                  viewModel.currentPageName = viewModel.tabs.keys.toList()[i];
                  viewModel.setCurrentPageIndex(i);
                },
                backgroundColor: ITheme.of(context).darkBackground,
                selectedItemColor: ITheme.of(context).primary,
                unselectedItemColor: ITheme.of(context).grayLight,
                selectedBackgroundColor: const Color(0x00000000),
                borderRadius: 8.0,
                itemBorderRadius: 8.0,
                margin: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                width: double.infinity,
                elevation: 0.0,
                items: [
                  FloatingNavbarItem(
                    customWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: viewModel.currentIndex == TabEnums.home.index
                              ? ITheme.of(context).primary
                              : ITheme.of(context).grayLight,
                          size: 24.0,
                        ),
                        Text(
                          LocaleKeys.bottomNavigationBar_main_page.translate,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: viewModel.currentIndex == TabEnums.home.index
                                ? ITheme.of(context).primary
                                : ITheme.of(context).grayLight,
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FloatingNavbarItem(
                    customWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.directions_car,
                          color: viewModel.currentIndex == TabEnums.mycars.index
                              ? ITheme.of(context).primary
                              : ITheme.of(context).grayLight,
                          size: 24.0,
                        ),
                        Text(
                          LocaleKeys.bottomNavigationBar_cars.translate,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: viewModel.currentIndex == TabEnums.mycars.index
                                ? ITheme.of(context).primary
                                : ITheme.of(context).grayLight,
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FloatingNavbarItem(
                    customWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble,
                          color: viewModel.currentIndex == TabEnums.messages.index
                              ? ITheme.of(context).primary
                              : ITheme.of(context).grayLight,
                          size: 24.0,
                        ),
                        Text(
                          LocaleKeys.bottomNavigationBar_messages.translate,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: viewModel.currentIndex == TabEnums.messages.index
                                ? ITheme.of(context).primary
                                : ITheme.of(context).grayLight,
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FloatingNavbarItem(
                    customWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: viewModel.currentIndex == TabEnums.user.index
                              ? ITheme.of(context).primary
                              : ITheme.of(context).grayLight,
                          size: 24.0,
                        ),
                        Text(
                          LocaleKeys.bottomNavigationBar_account.translate,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: viewModel.currentIndex == TabEnums.user.index
                                ? ITheme.of(context).primary
                                : ITheme.of(context).grayLight,
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
