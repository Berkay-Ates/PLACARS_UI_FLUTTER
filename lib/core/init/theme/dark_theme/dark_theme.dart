import 'dart:ui';

import '../itheme/iTheme.dart';

class DarkModeTheme extends ITheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF00A6FB);
  late Color secondary = const Color(0xFF53C6FF);
  late Color tertiary = const Color(0xFF0095DF);
  late Color alternate = const Color(0xFF1E2830);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF8B97A2);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF111417);
  late Color accent1 = const Color(0xFFEEEEEE);
  late Color accent2 = const Color(0xFFE0E0E0);
  late Color accent3 = const Color(0xFF757575);
  late Color accent4 = const Color(0xFF616161);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color background = const Color(0xFF1A1F24);
  late Color darkBackground = const Color(0xFF111417);
  late Color textColor = const Color(0xFFFFFFFF);
  late Color grayDark = const Color(0xFF57636C);
  late Color grayLight = const Color(0xFF8B97A2);
  late Color errorRed = const Color(0xFFF06A6A);
  late Color primaryBtnText = const Color(0xFFFFFFFF);
  late Color lineColor = const Color(0xFF22282F);
  late Color btnText = const Color(0xFFFFFFFF);
  late Color customColor3 = const Color(0xFFDF3F3F);
  late Color customColor4 = const Color(0xFF090F13);
  late Color white = const Color(0xFFFFFFFF);
  late Color backgroundComponents = const Color(0xFF1D2428);
  late Color primary600 = const Color(0xFF336A4A);
  late Color secondary600 = const Color(0xFF6D604A);
  late Color tertiary600 = const Color(0xFF0C2533);
  late Color darkBGstatic = const Color(0xFF0D1E23);
  late Color secondary30 = const Color(0x4D928163);
  late Color overlay0 = const Color(0x000B191E);
  late Color overlay = const Color(0xB20B191E);
  late Color primary30 = const Color(0x4D4B986C);
  late Color customColor1 = const Color(0xFF452FB7);
  late Color grayIcon = const Color(0xFF95A1AC);
  late Color gray200 = const Color(0xFFDBE2E7);
  late Color gray600 = const Color(0xFF262D34);
  late Color black600 = const Color(0xFF090F13);
  late Color tertiary400 = const Color(0xFF39D2C0);
  late Color noColor = const Color(0x000F1113);
  late Color pictonBlue = const Color(0xFF00A6FB);
  late Color deepSkyBlue = const Color(0xFF53C6FF);
  late Color celestialBlue = const Color(0xFF0095DF);
  late Color richBlack = const Color(0xFF020D13);
}
