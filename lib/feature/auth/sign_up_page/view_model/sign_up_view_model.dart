import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/core/constants/enums/cache_enum_keys.dart';
import 'package:placars_savt/core/extension/easy_localization_translate/easy_localization_translate.dart';
import 'package:placars_savt/core/init/cache/hive/hive_model.dart';
import 'package:placars_savt/feature/auth/sign_up_page/model/sign_up_model.dart';
import 'package:placars_savt/product/enums/prof_img_urls.dart';
import 'package:placars_savt/product/hive_models/user_hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/backend/backend_endpoints.dart';
import '../../email_verify_page/view/email_verify_view.dart';
import '../../../../core/base/view_model/base_view_model.dart';

import '../../../home/tab_page/view/tab_view.dart';
import '../model/registeration_model.dart';
part 'sign_up_view_model.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController? adsoyadController;

  TextEditingController? emailAddressController;

  TextEditingController? kullaniciadiController;

  TextEditingController? passwordCreateController;
  @observable
  bool passwordCreateVisibility = true;

  TextEditingController? passwordConfirmController;
  @observable
  bool passwordConfirmVisibility = true;

  @observable
  bool isLoading = false;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    adsoyadController ??= TextEditingController();
    emailAddressController ??= TextEditingController();
    kullaniciadiController ??= TextEditingController();
    passwordCreateController ??= TextEditingController();
    passwordConfirmController ??= TextEditingController();
    initHive();
  }

  @action
  void changePasswordsVisibility() {
    passwordCreateVisibility = !passwordCreateVisibility;
    passwordConfirmVisibility = !passwordConfirmVisibility;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  bool isPasswordsMatch() {
    if (passwordCreateController?.text == passwordConfirmController?.text) {
      return true;
    }
    return false;
  }

  @action
  Future signUpUser() async {
    if (formState.currentState?.validate() ?? false) {
      await registerUser();
    } else {
      showSnackS();
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

  Future registerUser() async {
    int random = Random().nextInt(DefaultProfileImageEnums.values.length);
    String imageUrl = DefaultProfileImageEnums.values.elementAt(random).imagePath;
    SignUpModel signUpModel = SignUpModel(
        username: kullaniciadiController?.text,
        email: emailAddressController?.text,
        password: passwordCreateController?.text,
        profileImgUrl: imageUrl,
        name: adsoyadController?.text);
    final response = await appService?.dio.post(BackendURLs.CREATE_ACCOUNT, data: signUpModel.toJson());
    if (response != null) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final RegisterationModel registerationModel = RegisterationModel.fromJson(data);
        if (registerationModel.access != null) {
          UserHiveModel userHiveModel = UserHiveModel(0, signUpModel.username, signUpModel.name, signUpModel.email,
              signUpModel.profileImgUrl, registerationModel.access);
          await userHiveCacheManager?.putItem(CacheEnumKeys.USERHIVEKEY.name, userHiveModel);
          navigateEmailSendPage();
        }
      }
    }
  }

  bool? isEmailUnique(String? email) {
    return true;
    //! girilen email veri tabanında varsa false yoksa true dondurecegiz.
  }

  bool? isUserNameUnique(String? userName) {
    return true;
    //! girilen isim varsa false yoksa true dondurecegiz
  }

  void navigateEmailSendPage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const EmailVerifyView()), (route) => false);
  }

  void navigateHomePage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const PlacarsTabView()), (route) => false);
  }

  void dispose() {
    adsoyadController?.dispose();
    emailAddressController?.dispose();
    kullaniciadiController?.dispose();
    passwordCreateController?.dispose();
    passwordConfirmController?.dispose();
  }
}
