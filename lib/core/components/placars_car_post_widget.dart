// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../init/theme/itheme/iTheme.dart';

class PlacarsCarPostsWidget extends StatelessWidget {
  const PlacarsCarPostsWidget({
    Key? key,
    required this.userImageUrl,
    required this.carPlate,
    required this.timePosted,
    required this.postImageUrl,
    required this.postDescription,
    required this.commentCount,
    required this.likeCount,
    required this.onTop,
  }) : super(key: key);

  final String userImageUrl;
  final String carPlate;
  final String timePosted;
  final String postImageUrl;
  final String postDescription;
  final int commentCount;
  final int likeCount;

  final Function onTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 6.0),
      child: InkWell(
        onTap: () => onTop(),
        child: Container(
          height: 350.0,
          decoration: BoxDecoration(
            color: ITheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
            shape: BoxShape.rectangle,
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 36.0,
                        height: 36.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          userImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          carPlate,
                          style: ITheme.of(context).bodyMedium.copyWith(
                                fontFamily: 'Lexend',
                                fontSize: 20.0,
                              ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                        child: Text(
                          timePosted,
                          textAlign: TextAlign.end,
                          style: ITheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    postImageUrl,
                    width: MediaQuery.of(context).size.width * 0.92,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: AutoSizeText(
                        postDescription,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: ITheme.of(context).bodyMedium.copyWith(
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                color: ITheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                              child: Text(
                                likeCount.toString(),
                                style: ITheme.of(context).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 8.0),
                              child: Icon(
                                Icons.mode_comment_outlined,
                                color: ITheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                              child: Text(
                                likeCount.toString(),
                                style: ITheme.of(context).bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
