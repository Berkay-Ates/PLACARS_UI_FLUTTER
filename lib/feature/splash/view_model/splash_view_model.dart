import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart' as parth_provider;

import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/constants/cache/language_enums.dart';
import '../../../core/constants/durations/app_durations.dart';
import '../../../core/constants/enums/cache_enum_keys.dart';
import '../../../core/init/cache/shared/i_shared_manager.dart';
import '../../../core/init/cache/shared/shared_manager.dart';
import '../../../core/init/cache/shared/shared_object.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../product/token/user_token.dart';
import '../../auth/sign_in_page/view/sign_in_view.dart';
import '../../home/tab_page/view/tab_view.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  ISharedManager? sharedManager;
  SharedPrefObject? sharedPrefObject;

  @observable
  bool isLoading = true;

  @observable
  bool isTokenExists = false;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    sharedPrefObject = SharedPrefObject.instance;
    initAndSetShared();
    initHive();
  }

  Future<void> initAndSetShared() async {
    await sharedPrefObject?.initShared();
    sharedManager = SharedManager(sharedPrefObject?.getSharedObject);
    checkUserToken();
    checkUserLang();
  }

  void checkUserLang() {
    final userLocale = sharedManager?.getString(LanguageEnums.english.name);
    if (userLocale != null) {
      if (userLocale == LanguageEnums.english.name) {
        baseContext.setLocale(LanguageManager.instance.enLocale);
      } else {
        baseContext.setLocale(LanguageManager.instance.trLocale);
      }
    }
  }

  Future<void> initHive() async {
    final applicationDirectory = await parth_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(applicationDirectory.path);
  }

  @action
  Future<void> checkUserToken() async {
    String? token = sharedManager?.getString(CacheEnumKeys.TOKEN.name);
    await Future.delayed(AppDurations.durationMedium);
    if (token != null) {
      UserToken.instance.setToken(token);
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          baseContext, MaterialPageRoute(builder: (context) => const PlacarsTabView()), (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          baseContext, MaterialPageRoute(builder: (context) => const SignInView()), (route) => false);
    }
  }
}
