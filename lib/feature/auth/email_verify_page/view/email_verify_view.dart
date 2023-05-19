import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../view_model/email_verify_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/components/placars_button_widget.dart';
import '../../../../core/init/theme/itheme/iTheme.dart';
import '../../../../core/init/theme/theme_provider/theme_provider.dart';
import '../../../../product/image/image_enums.dart';

class EmailVerifyView extends StatelessWidget {
  const EmailVerifyView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<EmailVerifyViewModel>(
        viewModel: EmailVerifyViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (context, viewModel) {
          return Scaffold(
            key: viewModel.scaffoldKey,
            backgroundColor: ITheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  context.read<ThemeProvider>().getThemeData == ThemeData.dark()
                      ? ImageEnumName.placarsbeyaz.svgPath
                      : ImageEnumName.placarsiyah.svgPath,
                  color: context.read<ThemeProvider>().getThemeData == ThemeData.dark()
                      ? ITheme.of(context).primaryText
                      : Colors.black,
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Observer(builder: (_) {
                                  return Text(
                                    viewModel.email ?? "No Mail Given",
                                    style: ITheme.of(context).bodyMedium.copyWith(
                                          fontFamily: 'Lexend',
                                          color: ITheme.of(context).primary,
                                        ),
                                  );
                                }),
                                Text(
                                  LocaleKeys.email_verificaiton_info_txt.translate,
                                  style: ITheme.of(context).bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Lottie.asset(ImageEnumName.emailSendLottie.lottiePath, width: 200),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Observer(builder: (_) {
                              return PlacarsButtonWidget(
                                onPressed: () {
                                  viewModel.navigateSignInPage();
                                },
                                text: LocaleKeys.email_verificaiton_another_account_btn.translate,
                                options: PlacarsButtonOptions(
                                  width: 130,
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: ITheme.of(context).primaryBackground,
                                  textStyle: ITheme.of(context).titleSmall.copyWith(
                                        fontFamily: 'Lexend',
                                        color: ITheme.of(context).primary,
                                      ),
                                  borderSide: BorderSide(
                                    color: ITheme.of(context).primary,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );
                            }),
                            Observer(builder: (_) {
                              return PlacarsButtonWidget(
                                onPressed: () async {
                                  await viewModel.isMailVerified();
                                },
                                text: LocaleKeys.email_verificaiton_verified_btn.translate,
                                options: PlacarsButtonOptions(
                                  width: 130,
                                  height: 40,
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: ITheme.of(context).primary,
                                  textStyle: ITheme.of(context).titleSmall.copyWith(
                                        fontFamily: 'Lexend',
                                        color: ITheme.of(context).primaryText,
                                      ),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
