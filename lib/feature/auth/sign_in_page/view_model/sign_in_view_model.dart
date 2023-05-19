import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/core/extension/easy_localization_translate/easy_localization_translate.dart';
import 'package:placars_savt/core/init/lang/locale_keys.g.dart';
import 'package:placars_savt/feature/auth/sign_in_page/model/sign_in_model.dart';
import 'package:placars_savt/feature/auth/sign_in_page/model/sign_in_response_model.dart';
import 'package:placars_savt/product/backend/backend_endpoints.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../core/init/cache/shared/i_shared_manager.dart';
import '../../../../core/init/cache/shared/shared_manager.dart';
import '../../../../core/init/cache/shared/shared_object.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../../../home/tab_page/view/tab_view.dart';
import '../../forgot_password/view/forgot_pass_view.dart';
import '../../sign_up_page/view/sign_up_view.dart';

part 'sign_in_view_model.g.dart';

class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

abstract class _SignInViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController? emailAddressLoginController;
  TextEditingController? passwordLoginController;

  ISharedManager? sharedManager;
  SharedPrefObject? sharedPrefObject;

  @observable
  bool passwordLoginVisibility = true;

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => baseContext = context;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
  }

  @override
  void init() {
    emailAddressLoginController ??= TextEditingController();
    passwordLoginController ??= TextEditingController();
    initHive();
    initSharedPref();
  }

  void initSharedPref() {
    sharedPrefObject = SharedPrefObject.instance;
    sharedManager = SharedManager(sharedPrefObject?.getSharedObject);
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void dispose() {
    emailAddressLoginController?.dispose();
    passwordLoginController?.dispose();
  }

  @action
  void changePasswordVisibility() {
    passwordLoginVisibility = !passwordLoginVisibility;
  }

  @action
  Future signInUser() async {
    if (formState.currentState?.validate() ?? false) {
      try {
        await signInFunc();
      } catch (e) {
        inspect(e);
        showSnackS();
      }
    }
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: Text(
        LocaleKeys.signIn_try_again_later.translate,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  Future signInFunc() async {
    final SignInModel signInModel =
        SignInModel(email: emailAddressLoginController?.text, password: passwordLoginController?.text);
    final response = await appService?.dio.get(BackendURLs.SING_IN, data: signInModel.toJson());
    if (response?.statusCode == HttpStatus.accepted) {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        final responseModel = SignInModelResponse.fromJson(data);
        UserHiveModel userHiveModel = UserHiveModel(
          0,
          responseModel.username,
          responseModel.name,
          responseModel.email,
          responseModel.profile_img_url,
          responseModel.access,
        );
        await userHiveCacheManager?.putItem(CacheEnumKeys.USERHIVEKEY.name, userHiveModel);
        if ((responseModel.isAcitve ?? false) && (responseModel.email?.isNotEmpty ?? false)) {
          final tokenSaveRes = await saveUserToken(responseModel.email!);
          if (tokenSaveRes ?? false) {
            navigateHomePage();
          }
        } else {
          showSnackS();
        }
      }
    }
  }

  Future<bool?> saveUserToken(String token) async {
    return await sharedManager?.setString(CacheEnumKeys.TOKEN.name, token);
  }

  void navigateForgotPassPage() {
    Navigator.push(baseContext, MaterialPageRoute(builder: (context) => const ForgotPasswordView()));
  }

  void navigateHomePage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const PlacarsTabView()), (route) => false);
  }

  void navigateSignUpPage() {
    Navigator.push(baseContext, MaterialPageRoute(builder: (context) => const SignUpView()));
  }
}
