// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'add_car_post_model.g.dart';

@JsonSerializable()
class AddCarPostModel {
  String? carPlate;
  String? carBrand;
  String? carPhotoUrl;
  String? carLicencePhotoUrl;
  String? owner;
  String? isCarSale;
  String? carKm;
  String? carDescription;
  int? carCommentCount;
  int? carLikeCount;

  AddCarPostModel(
    this.carPlate,
    this.carBrand,
    this.carPhotoUrl,
    this.carLicencePhotoUrl,
    this.owner,
    this.isCarSale,
    this.carKm,
    this.carDescription,
    this.carCommentCount,
    this.carLikeCount,
  );

  factory AddCarPostModel.fromJson(Map<String, dynamic> json) {
    return _$AddCarPostModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddCarPostModelToJson(this);
  }
}
