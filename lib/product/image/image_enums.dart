enum ImageEnumName {
  splash("splash"),
  placarsbeyaz("placarsbeyaz"),
  placarsiyah("placarssiyah"),
  emailSendLottie("lottie_email_send");

  final String name;
  const ImageEnumName(this.name);

  String get imagePath => "asset/image/$name.png";
  String get svgPath => "asset/svg/$name.svg";
  String get lottiePath => "asset/lotties/$name.json";
}
