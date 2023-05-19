import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/core/extension/easy_localization_translate/easy_localization_translate.dart';
import 'package:placars_savt/feature/auth/email_verify_page/model/email_verify_model.dart';
import 'package:placars_savt/product/backend/backend_endpoints.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../core/init/cache/shared/i_shared_manager.dart';
import '../../../../core/init/cache/shared/shared_manager.dart';
import '../../../../core/init/cache/shared/shared_object.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../../sign_in_page/view/sign_in_view.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../home/tab_page/view/tab_view.dart';
part 'email_verify_view_model.g.dart';

class EmailVerifyViewModel = _EmailVerifyViewModelBase with _$EmailVerifyViewModel;

abstract class _EmailVerifyViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ISharedManager? sharedManager;
  SharedPrefObject? sharedPrefObject;

  @observable
  bool isLoading = false;

  @observable
  String? email;

  @override
  void setContext(BuildContext context) => baseContext = context;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    setMail();
  }

  Future<bool?> saveUserToken(String token) async {
    return await sharedManager?.setString(CacheEnumKeys.TOKEN.name, token);
  }

  @override
  void init() {
    sharedPrefObject = SharedPrefObject.instance;
    sharedManager = SharedManager(sharedPrefObject?.getSharedObject);
    initHive();
  }

  @action
  void setMail() {
    email = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name)?.email ?? "";
  }

  @action
  Future isMailVerified() async {
    changeLoading();
    try {
      if (email?.isNotEmpty ?? false) {
        final response = await appService?.dio.get("${BackendURLs.CHECK_EMAIL_VERIFICATION}$email");
        final data = response?.data;
        if (data is Map<String, dynamic>) {
          final emailCheckRes = EmailVerifyModel.fromJson(data);
          if (emailCheckRes.exist ?? false) {
            final tokenSaveRes = await saveUserToken(email!);
            if (tokenSaveRes ?? false) {
              navigateHomePage();
            }
          } else {
            showSnackS();
          }
        }
      }
    } catch (e) {
      changeLoading();
    }
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void navigateHomePage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const PlacarsTabView()), (route) => false);
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: Text(
        LocaleKeys.signUp_verify_your_account.translate,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  void navigateSignInPage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const SignInView()), (route) => false);
  }
}
