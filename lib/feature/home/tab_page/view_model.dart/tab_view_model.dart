import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/view_model/base_view_model.dart';
import '../../cars_page/view/my_cars_view.dart';
import '../../home_page/view/home_view.dart';
import '../../messages_page/view/messages_view.dart';
import '../../../../product/enums/tab_enums.dart';

import '../../settings_page/view/user_settings_view.dart';
part 'tab_view_model.g.dart';

class PlacarsTabViewModel = _PlacarsTabViewModelBase with _$PlacarsTabViewModel;

abstract class _PlacarsTabViewModelBase with Store, BaseViewModel {
  TabController? tabController;

  String currentPageName = TabEnums.home.name;
  late Widget? currentPage;

  @observable
  int currentIndex = 0;

  final tabs = {
    TabEnums.home.name: const HomeView(),
    TabEnums.mycars.name: const CarsView(),
    TabEnums.messages.name: const MessagesView(),
    TabEnums.user.name: const UserSettingsView(),
  };

  @action
  void setCurrentPageIndex(int i) {
    currentIndex = i;
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}
}
