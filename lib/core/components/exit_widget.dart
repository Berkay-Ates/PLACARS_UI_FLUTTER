// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../feature/auth/sign_in_page/view/sign_in_view.dart';
import '../extension/easy_localization_translate/easy_localization_translate.dart';
import '../init/lang/locale_keys.g.dart';
import '../init/theme/itheme/iTheme.dart';
import 'placars_button_widget.dart';

class ExitWidget extends StatelessWidget {
  const ExitWidget({
    Key? key,
    required this.logout,
  }) : super(key: key);

  final Function logout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280.0,
      decoration: BoxDecoration(
        color: ITheme.of(context).secondaryBackground,
        boxShadow: const [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: PlacarsButtonWidget(
                onPressed: () => logout(),
                text: LocaleKeys.exit_widget_exit.translate,
                options: PlacarsButtonOptions(
                  width: 150.0,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFFFF5963),
                  textStyle: ITheme.of(context).titleSmall.copyWith(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: PlacarsButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: LocaleKeys.exit_widget_dispose.translate,
                options: PlacarsButtonOptions(
                  width: 150.0,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: ITheme.of(context).primaryBackground,
                  textStyle: ITheme.of(context).headlineMedium.copyWith(
                        fontFamily: 'Lexend',
                        fontSize: 16.0,
                      ),
                  elevation: 2.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
