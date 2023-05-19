// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../init/theme/itheme/iTheme.dart';

class ReceiverMessageBubbleWidget extends StatelessWidget {
  const ReceiverMessageBubbleWidget({
    Key? key,
    required this.imageUrl,
    required this.message,
    required this.datePosted,
    required this.sender,
  }) : super(key: key);

  final String imageUrl;
  final String message;
  final String datePosted;

  final String sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(2.0, 1.0, 2.0, 1.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.75,
                  ),
                  decoration: BoxDecoration(
                    color: ITheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          sender.split('@')[0],
                          style: ITheme.of(context).bodySmall,
                        ),
                        Text(
                          message,
                          style: ITheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 1.0, 1.0, 1.0),
                child: Text(
                  datePosted,
                  style: ITheme.of(context).bodySmall.copyWith(fontSize: 11),
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.network(
              imageUrl,
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
