import 'package:flutter/material.dart';
import '../../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../view_model/profile_settings_view_model.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/placars_button_widget.dart';
import '../../../../../core/components/placars_icon_button.dart';
import '../../../../../core/init/theme/itheme/iTheme.dart';

class ProfileSettingsView extends StatelessWidget {
  const ProfileSettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileSettingsViewModel>(
        viewModel: ProfileSettingsViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (context, viewModel) {
          return Scaffold(
            key: viewModel.scaffoldKey,
            backgroundColor: ITheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: ITheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: PlacarsIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                LocaleKeys.edit_profile_appbar.translate,
                style: ITheme.of(context).headlineMedium,
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 1.0, 5.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1.0,
                        decoration: BoxDecoration(
                          color: ITheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x430F1113),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1531123414780-f74242c2b052?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                child: PlacarsButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: LocaleKeys.edit_profile_prfl_photo.translate,
                                  options: PlacarsButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    color: ITheme.of(context).primaryBackground,
                                    textStyle: ITheme.of(context).bodyMedium,
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.9, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                  child: Text(
                                    LocaleKeys.edit_profile_user_name.translate,
                                    style: ITheme.of(context).bodyMedium.copyWith(
                                          fontFamily: 'Lexend',
                                          color: ITheme.of(context).tertiary,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: viewModel.textController1,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: LocaleKeys.edit_profile_new_userName.translate,
                                          hintStyle: ITheme.of(context).bodySmall,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ITheme.of(context).primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: ITheme.of(context).bodyMedium,
                                        maxLines: null,
                                        validator: null, //.textController1Validator.asValidator(context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(-0.9, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                  child: Text(
                                    LocaleKeys.edit_profile_name_surname.translate,
                                    style: ITheme.of(context).bodyMedium.copyWith(
                                          fontFamily: 'Lexend',
                                          color: ITheme.of(context).tertiary,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: viewModel.textController2,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: LocaleKeys.edit_profile_new_name_surname.translate,
                                            hintStyle: ITheme.of(context).bodySmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ITheme.of(context).primaryBackground,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: ITheme.of(context).bodyMedium,
                                          maxLines: null,
                                          validator: null, // _model.textController2Validator.asValidator(context),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: const AlignmentDirectional(-0.9, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                  child: Text(
                                    LocaleKeys.edit_profile_name_surname.translate,
                                    style: ITheme.of(context).bodyMedium.copyWith(
                                          fontFamily: 'Lexend',
                                          color: ITheme.of(context).tertiary,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          controller: viewModel.textController3,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: LocaleKeys.edit_profile_new_name_surname.translate,
                                            hintStyle: ITheme.of(context).bodySmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ITheme.of(context).primaryBackground,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: ITheme.of(context).bodyMedium,
                                          maxLines: null,
                                          validator: null, // _model.textController3Validator.asValidator(context),
                                        ),
                                      ),
                                    ],
                                  )),
                              Align(
                                alignment: const AlignmentDirectional(-0.9, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                  child: Text(
                                    LocaleKeys.edit_profile_password.translate,
                                    style: ITheme.of(context).bodyMedium.copyWith(
                                          fontFamily: 'Lexend',
                                          color: ITheme.of(context).tertiary,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 60.0, 0.0),
                                        child: TextFormField(
                                          controller: viewModel.textController4,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: LocaleKeys.edit_profile_new_password.translate,
                                            hintStyle: ITheme.of(context).bodySmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: ITheme.of(context).primaryBackground,
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x00000000),
                                                width: 2.0,
                                              ),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: ITheme.of(context).bodyMedium,
                                          maxLines: null,
                                          validator: null, //_model.textController4Validator.asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: viewModel.textController5,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: LocaleKeys.edit_profile_verify_password.translate,
                                          hintStyle: ITheme.of(context).bodySmall,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: ITheme.of(context).primaryBackground,
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: ITheme.of(context).bodyMedium,
                                        maxLines: null,
                                        validator: (value) => viewModel.passwordController(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                child: PlacarsButtonWidget(
                                  onPressed: () {
                                    viewModel.updateUserInfo();
                                  },
                                  text: LocaleKeys.edit_profile_update_profile_btn.translate,
                                  options: PlacarsButtonOptions(
                                    width: 190.0,
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                    color: ITheme.of(context).primary,
                                    textStyle: ITheme.of(context).titleSmall.copyWith(
                                          fontFamily: 'Lexend',
                                          color: ITheme.of(context).textColor,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
