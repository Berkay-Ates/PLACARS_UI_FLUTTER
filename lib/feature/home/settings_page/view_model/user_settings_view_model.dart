import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/feature/auth/sign_in_page/view/sign_in_view.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../profile_settings/view/profile_settings_view.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/shared/i_shared_manager.dart';
import '../../../../core/init/cache/shared/shared_manager.dart';
import '../../../../core/init/cache/shared/shared_object.dart';
import '../../../../core/init/theme/theme_provider/theme_provider.dart';
import '../notifications_settings/view/notifications_view.dart';

part 'user_settings_view_model.g.dart';

class UserSettingsViewModel = _UserSettingsViewModelBase with _$UserSettingsViewModel;

abstract class _UserSettingsViewModelBase with Store, BaseViewModel {
  ISharedManager sharedManager = SharedManager(SharedPrefObject.instance?.getSharedObject);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  @observable
  bool switchValue = false;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    readTheme();
    initHive();
  }

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  @observable
  UserHiveModel? userHiveModel;

  @action
  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  @action
  void readTheme() {
    switchValue = sharedManager.getBool(CacheEnumKeys.THEME.name) ?? false;
  }

  @action
  Future<void> changeTheme(bool newValue) async {
    switchValue = newValue;
    final result = await sharedManager.setBool(CacheEnumKeys.THEME.name, newValue);
    baseContext.read<ThemeProvider>().changeTheme(newValue);
  }

  void navigateToNotifSet() {
    Navigator.push(baseContext, MaterialPageRoute(builder: (context) => const NotificationsSettingView()));
  }

  void navigateToProfileSettings() {
    Navigator.push(baseContext, MaterialPageRoute(builder: (context) => const ProfileSettingsView()));
  }

  void navigateToSignInPage() {
    Navigator.push(baseContext, MaterialPageRoute(builder: (context) => const SignInView()));
  }

  Future logoutUser() async {
    IHivecacheManager<UserHiveModel>? userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager.init();
    userHiveCacheManager.removeItem(CacheEnumKeys.USERHIVEKEY.name);
    SharedPrefObject? sharedPrefObject = SharedPrefObject.instance;
    SharedManager sharedManager = SharedManager(sharedPrefObject?.getSharedObject);
    await sharedManager.removeData(CacheEnumKeys.TOKEN.name);
    navigateToSignInPage();
  }
}
