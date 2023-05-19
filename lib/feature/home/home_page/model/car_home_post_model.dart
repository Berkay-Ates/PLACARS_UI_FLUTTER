// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part "car_home_post_model.g.dart";

@JsonSerializable()
class CarListModel {
  List<Cars>? cars;

  CarListModel({this.cars});

  factory CarListModel.fromJson(Map<String, dynamic> json) {
    return _$CarListModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CarListModelToJson(this);
  }
}

@JsonSerializable()
class Cars {
  String? carOwnerEmail;
  String? carPlate;
  String? carBrand;
  String? carPhotoUrl;
  bool? isCarSale;
  int? carKm;
  String? carDescription;
  String? carLicencePhotoUrl;
  int? carCommentCount;
  int? carLikeCount;
  String? postDate;
  String? profile_img_url;

  Cars(
      {this.carOwnerEmail,
      this.carPlate,
      this.carBrand,
      this.carPhotoUrl,
      this.isCarSale,
      this.carKm,
      this.carDescription,
      this.carLicencePhotoUrl,
      this.carCommentCount,
      this.carLikeCount,
      this.postDate,
      this.profile_img_url});

  factory Cars.fromJson(Map<String, dynamic> json) {
    return _$CarsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CarsToJson(this);
  }
}
