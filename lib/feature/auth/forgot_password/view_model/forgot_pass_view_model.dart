import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/base/view_model/base_view_model.dart';
part 'forgot_pass_view_model.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController? emailAddressController;

  @observable
  bool isLoading = false;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    emailAddressController ??= TextEditingController();
  }

  void dispose() {
    emailAddressController?.dispose();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void sendPasswResetMail() {
    changeLoading();
    if (formState.currentState?.validate() ?? false) {}
    changeLoading();
  }
}
