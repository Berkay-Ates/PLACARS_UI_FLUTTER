import 'package:flutter/cupertino.dart';

import '../extension/easy_localization_translate/easy_localization_translate.dart';
import '../init/lang/locale_keys.g.dart';
import '../init/theme/itheme/iTheme.dart';

class NotificationInfoWidget extends StatelessWidget {
  const NotificationInfoWidget({
    Key? key,
    required this.plate,
    required this.date,
  }) : super(key: key);

  final String plate;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ITheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.0,
              color: ITheme.of(context).lineColor,
              offset: const Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
          shape: BoxShape.rectangle,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 4.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: ITheme.of(context).primary,
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "$plate ${LocaleKeys.notifications_page_new_comment.translate}",
                    style: ITheme.of(context).titleMedium.copyWith(
                          fontFamily: 'Lexend',
                          fontSize: 14.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                child: Text(
                  date,
                  style: ITheme.of(context).bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
