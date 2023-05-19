import 'dart:math';

enum DefaultProfileImageEnums {
  img1,
  img2,
  img3,
  img4,
  img5,
  img6,
  img7,
  img8,
  img9;

  String get imagePath => "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/$name.jpg?alt=media";
  String get randomImage {
    int random = Random().nextInt(values.length);
    String image = "";
    values.map((e) {
      if (e.index == random) {
        image = e.imagePath;
      }
    });
    return image;
  }
}
