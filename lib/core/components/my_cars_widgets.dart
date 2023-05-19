import 'package:flutter/material.dart';

import '../init/theme/itheme/iTheme.dart';

class MyCarsWidget extends StatelessWidget {
  const MyCarsWidget({
    Key? key,
    required this.imgUrl,
    required this.plate,
    required this.description,
    required this.isSale,
    required this.km,
    required this.model,
    required this.deleteCar,
    required this.onCarTopped,
  }) : super(key: key);

  final String imgUrl;
  final String plate;
  final String description;
  final bool isSale;
  final String km;
  final String model;
  final Function deleteCar;
  final Function onCarTopped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ITheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.network(imgUrl).image,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x430F1113),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: InkWell(
            onTap: () => onCarTopped(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          plate,
                          textAlign: TextAlign.start,
                          style: ITheme.of(context).bodySmall.copyWith(
                                fontFamily: 'Lexend',
                                color: ITheme.of(context).primary,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => deleteCar(),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.cancel_outlined,
                              color: ITheme.of(context).primary,
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: ITheme.of(context).primaryBackground,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 120.0, 0.0),
                          child: Text(
                            description /* Aracım 2023 modeldir. Sahibind... */,
                            textAlign: TextAlign.justify,
                            style: ITheme.of(context).bodySmall.copyWith(
                                  fontFamily: 'Lexend',
                                  color: ITheme.of(context).primaryText,
                                  fontSize: 13.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          "Durum: " /* Durum:  */,
                          style: ITheme.of(context).titleMedium.copyWith(
                                fontFamily: 'Lexend',
                                fontSize: 14.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          isSale ? 'Satılık' : 'Satılık Değil' /* Satılık */,
                          style: ITheme.of(context).titleMedium.copyWith(
                                fontFamily: 'Lexend',
                                color: ITheme.of(context).success,
                                fontSize: 14.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          km /* 9.900 KM */,
                          style: ITheme.of(context).bodyMedium.copyWith(
                                fontFamily: 'Lexend',
                                color: ITheme.of(context).primaryText,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                        child: Icon(
                          Icons.directions_car_sharp,
                          color: ITheme.of(context).primary,
                          size: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          model /* BMW 435i GRAN COUPE 2023 */,
                          style: ITheme.of(context).bodyMedium.copyWith(
                                fontFamily: 'Lexend',
                                color: ITheme.of(context).primaryText,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
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
