import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/placars_button_widget.dart';
import '../../../../../core/components/placars_icon_button.dart';
import '../../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../core/init/theme/itheme/iTheme.dart';
import '../view_model/notifications_view_model.dart';

class NotificationsSettingView extends StatelessWidget {
  const NotificationsSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseView<NotificationsViewModel>(
        viewModel: NotificationsViewModel(),
        onModelReady: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
        },
        onPageBuilder: (context, viewModel) {
          return Scaffold(
            key: viewModel.scaffoldKey,
            backgroundColor: ITheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: ITheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: PlacarsIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: ITheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                LocaleKeys.notifications_settings_prefers.translate,
                style: ITheme.of(context).headlineMedium,
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Observer(builder: (_) {
                    return SwitchListTile.adaptive(
                      value: viewModel.switchListTileValue ??= true,
                      onChanged: (newValue) {
                        viewModel.changeNotificationsRejYes(newValue);
                      },
                      title: Text(
                        LocaleKeys.notifications_settings_notifications_prefer.translate,
                        style: ITheme.of(context).headlineSmall,
                      ),
                      subtitle: Text(
                        LocaleKeys.notifications_settings_explain_text.translate,
                        style: ITheme.of(context).bodySmall,
                      ),
                      activeColor: ITheme.of(context).primary,
                      activeTrackColor: const Color(0x8A4B39EF),
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    );
                  }),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Observer(builder: (_) {
                      return PlacarsButtonWidget(
                        onPressed: viewModel.isLoading
                            ? null
                            : () async {
                                viewModel.saveNotificationsSettings();
                              },
                        text: LocaleKeys.notifications_settings_save.translate,
                        options: PlacarsButtonOptions(
                          width: 170.0,
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: ITheme.of(context).primary,
                          textStyle: ITheme.of(context).titleSmall.copyWith(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
