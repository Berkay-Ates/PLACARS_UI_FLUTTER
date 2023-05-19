// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_car_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCarPostModel _$AddCarPostModelFromJson(Map<String, dynamic> json) =>
    AddCarPostModel(
      json['carPlate'] as String?,
      json['carBrand'] as String?,
      json['carPhotoUrl'] as String?,
      json['carLicencePhotoUrl'] as String?,
      json['owner'] as String?,
      json['isCarSale'] as String?,
      json['carKm'] as String?,
      json['carDescription'] as String?,
      json['carCommentCount'] as int?,
      json['carLikeCount'] as int?,
    );

Map<String, dynamic> _$AddCarPostModelToJson(AddCarPostModel instance) =>
    <String, dynamic>{
      'carPlate': instance.carPlate,
      'carBrand': instance.carBrand,
      'carPhotoUrl': instance.carPhotoUrl,
      'carLicencePhotoUrl': instance.carLicencePhotoUrl,
      'owner': instance.owner,
      'isCarSale': instance.isCarSale,
      'carKm': instance.carKm,
      'carDescription': instance.carDescription,
      'carCommentCount': instance.carCommentCount,
      'carLikeCount': instance.carLikeCount,
    };
