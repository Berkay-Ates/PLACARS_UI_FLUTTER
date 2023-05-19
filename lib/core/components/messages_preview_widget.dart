// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../init/theme/itheme/iTheme.dart';

class MessagePreviewWidget extends StatelessWidget {
  const MessagePreviewWidget({
    Key? key,
    required this.imgUrl,
    required this.userName,
    required this.previousMessage,
    required this.onTap,
  }) : super(key: key);

  final String imgUrl;
  final String userName;
  final String previousMessage;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 3.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.96,
          height: 80.0,
          decoration: BoxDecoration(
            color: ITheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: ITheme.of(context).lineColor,
                offset: const Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 44.0,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color: ITheme.of(context).primary,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(44.0),
                      child: Image.network(
                        imgUrl,
                        width: 44.0,
                        height: 44.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                          child: Text(
                            userName,
                            style: ITheme.of(context).headlineSmall,
                          ),
                        ),
                        Text(
                          previousMessage,
                          style: ITheme.of(context).bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: ITheme.of(context).secondaryText,
                  size: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
