import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/placars_button_widget.dart';
import '../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';
import '../../../../product/validators/email_validators.dart';
import '../view_model/sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
        viewModel: SignUpViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (context, viewModel) {
          return Scaffold(
            key: viewModel.scaffoldKey,
            backgroundColor: ITheme.of(context).primaryBackground,
            body: SingleChildScrollView(
              child: Form(
                key: viewModel.formState,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.05, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 1.0,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 0.0, 20.0),
                                      child: Text(
                                        LocaleKeys.signUp_appName.translate,
                                        style: ITheme.of(context).bodyMedium.copyWith(
                                              fontFamily: 'Lexend',
                                              fontSize: 50.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 30.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  LocaleKeys.signUp_lets_Start.translate,
                                                  style: ITheme.of(context).displaySmall,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    LocaleKeys.signUp_start_account_creating.translate,
                                                    style: ITheme.of(context).titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                              child: TextFormField(
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.text,
                                                controller: viewModel.adsoyadController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: LocaleKeys.signUp_your_name_surname.translate,
                                                  labelStyle: ITheme.of(context).bodySmall,
                                                  hintText: LocaleKeys.signUp_user_name_hint.translate,
                                                  hintStyle: ITheme.of(context).bodySmall,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  focusedErrorBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: ITheme.of(context).secondaryBackground,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                ),
                                                style: ITheme.of(context).bodyMedium,
                                                validator: (value) => (value?.length ?? 0) >= 5
                                                    ? null
                                                    : LocaleKeys.signUp_invalid_name.translate,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: TextFormField(
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.emailAddress,
                                                controller: viewModel.emailAddressController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: LocaleKeys.signUp_your_email.translate,
                                                  labelStyle: ITheme.of(context).bodySmall,
                                                  hintText: LocaleKeys.signUp_email_hint.translate,
                                                  hintStyle: ITheme.of(context).bodySmall,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  focusedErrorBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: ITheme.of(context).secondaryBackground,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                ),
                                                style: ITheme.of(context).bodyMedium,
                                                validator: (value) => value?.isValidMail ?? false
                                                    ? (viewModel.isEmailUnique(value) ?? false)
                                                        ? null
                                                        : LocaleKeys.signUp_invalid_email.translate
                                                    : LocaleKeys.signUp_invalid_email.translate,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: TextFormField(
                                                textInputAction: TextInputAction.next,
                                                keyboardType: TextInputType.text,
                                                controller: viewModel.kullaniciadiController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: LocaleKeys.signUp_your_user_name.translate,
                                                  labelStyle: ITheme.of(context).bodySmall,
                                                  hintText: LocaleKeys.signUp_user_name_hint.translate,
                                                  hintStyle: ITheme.of(context).bodySmall,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  focusedErrorBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: ITheme.of(context).secondaryBackground,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                ),
                                                style: ITheme.of(context).bodyMedium,
                                                validator: (value) {
                                                  if ((value?.length ?? 0) < 5) {
                                                    return LocaleKeys.signUp_invalid_user_name.translate;
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: Observer(builder: (_) {
                                                return TextFormField(
                                                  textInputAction: TextInputAction.next,
                                                  keyboardType: TextInputType.name,
                                                  controller: viewModel.passwordCreateController,
                                                  obscureText: viewModel.passwordCreateVisibility,
                                                  decoration: InputDecoration(
                                                    labelText: LocaleKeys.signUp_your_password.translate,
                                                    labelStyle: ITheme.of(context).bodySmall,
                                                    hintText: LocaleKeys.signUp_password_hint.translate,
                                                    hintStyle: ITheme.of(context).bodySmall,
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: ITheme.of(context).secondaryBackground,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                    suffixIcon: InkWell(
                                                      onTap: () => viewModel.changePasswordsVisibility(),
                                                      focusNode: FocusNode(skipTraversal: true),
                                                      child: Icon(
                                                        viewModel.passwordConfirmVisibility
                                                            ? Icons.visibility_off_outlined
                                                            : Icons.visibility_outlined,
                                                        color: ITheme.of(context).secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  style: ITheme.of(context).bodyMedium,
                                                  validator: (value) => ((value?.length ?? 0) > 6)
                                                      ? null
                                                      : LocaleKeys.signUp_invalid_password.translate,
                                                );
                                              }),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                              child: Observer(builder: (_) {
                                                return TextFormField(
                                                  textInputAction: TextInputAction.go,
                                                  keyboardType: TextInputType.text,
                                                  controller: viewModel.passwordConfirmController,
                                                  obscureText: viewModel.passwordConfirmVisibility,
                                                  decoration: InputDecoration(
                                                    labelText: LocaleKeys.signUp_verify_password.translate,
                                                    labelStyle: ITheme.of(context).bodySmall,
                                                    hintText: LocaleKeys.signUp_password_again_hint.translate,
                                                    hintStyle: ITheme.of(context).bodySmall,
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    focusedErrorBorder: OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color: Color(0x00000000),
                                                        width: 1.0,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor: ITheme.of(context).secondaryBackground,
                                                    contentPadding:
                                                        const EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 20.0, 24.0),
                                                    suffixIcon: InkWell(
                                                      onTap: () => viewModel.changePasswordsVisibility(),
                                                      focusNode: FocusNode(skipTraversal: true),
                                                      child: Icon(
                                                        viewModel.passwordConfirmVisibility
                                                            ? Icons.visibility_off_outlined
                                                            : Icons.visibility_outlined,
                                                        color: ITheme.of(context).secondaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  style: ITheme.of(context).bodyMedium,
                                                  validator: (value) {
                                                    if (viewModel.isPasswordsMatch()) {
                                                      return null;
                                                    }
                                                    return LocaleKeys.signUp_passwords_missmatch.translate;
                                                  },
                                                );
                                              }),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                                              child: Observer(builder: (_) {
                                                return PlacarsButtonWidget(
                                                  onPressed: () async {
                                                    await viewModel.signUpUser();
                                                  },
                                                  text: LocaleKeys.signUp_create_account_btn.translate,
                                                  options: PlacarsButtonOptions(
                                                    width: 140.0,
                                                    height: 50.0,
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                    color: ITheme.of(context).primary,
                                                    textStyle: ITheme.of(context).titleSmall.copyWith(
                                                          fontFamily: 'Lexend',
                                                          fontSize: 14.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                );
                                              }),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.8,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: ITheme.of(context).secondaryBackground,
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.arrow_back_rounded,
                                                          color: ITheme.of(context).primary,
                                                          size: 24.0,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 24.0, 0.0),
                                                          child: Text(
                                                            LocaleKeys.signUp_enter_to_app.translate,
                                                            style: ITheme.of(context).bodyMedium.copyWith(
                                                                  fontFamily: 'Lexend',
                                                                  color: ITheme.of(context).primary,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          LocaleKeys.signUp_have_an_account.translate,
                                                          style: ITheme.of(context).bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        onDispose: (viewModel) => viewModel.dispose());
  }
}
