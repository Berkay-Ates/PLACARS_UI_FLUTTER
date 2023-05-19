import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../../core/base/view_model/base_view_model.dart';
import '../../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../../core/init/cache/shared/shared_manager.dart';
import '../../../../../core/init/cache/shared/shared_object.dart';
part 'notifications_view_model.g.dart';

class NotificationsViewModel = _NotificationsViewModelBase with _$NotificationsViewModel;

abstract class _NotificationsViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  SharedManager sharedManager = SharedManager(SharedPrefObject.instance?.getSharedObject);

  @observable
  bool? switchListTileValue = true;

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    switchListTileValue = sharedManager.getBool(CacheEnumKeys.NOTIFICATION.name);
  }

  @action
  void changeNotificationsRejYes(bool value) {
    switchListTileValue = value;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future saveNotificationsToLocale() async {
    if (switchListTileValue != null) {
      await sharedManager.setBool(CacheEnumKeys.NOTIFICATION.name, switchListTileValue!);
    }
  }

  Future saveNotificationsToServer() async {}

  Future saveNotificationsSettings() async {
    changeLoading();
    await saveNotificationsToLocale();
    await saveNotificationsToServer();
    changeLoading();
    navigatorBack();
  }

  void navigatorBack() {
    Navigator.pop(baseContext);
  }
}
