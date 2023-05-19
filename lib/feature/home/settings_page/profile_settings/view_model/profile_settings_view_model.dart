import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';

import '../../../../../core/base/view_model/base_view_model.dart';
part 'profile_settings_view_model.g.dart';

class ProfileSettingsViewModel = _ProfileSettingsViewModelBase with _$ProfileSettingsViewModel;

abstract class _ProfileSettingsViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    textController1 ??= TextEditingController();
    textController2 ??= TextEditingController();
    textController3 ??= TextEditingController();
    textController4 ??= TextEditingController();
    textController5 ??= TextEditingController();
  }

  @action
  String? passwordController() {
    if (textController4?.text != textController5?.text) {
      return LocaleKeys.edit_profile_passwords_missmatch.translate;
    }
    return null;
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
  }

  void updateUserInfo() {
    if (formKey.currentState?.validate() == null) {}
  }
}
