// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_home_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarListModel _$CarListModelFromJson(Map<String, dynamic> json) => CarListModel(
      cars: (json['cars'] as List<dynamic>?)
          ?.map((e) => Cars.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarListModelToJson(CarListModel instance) =>
    <String, dynamic>{
      'cars': instance.cars,
    };

Cars _$CarsFromJson(Map<String, dynamic> json) => Cars(
      carOwnerEmail: json['carOwnerEmail'] as String?,
      carPlate: json['carPlate'] as String?,
      carBrand: json['carBrand'] as String?,
      carPhotoUrl: json['carPhotoUrl'] as String?,
      isCarSale: json['isCarSale'] as bool?,
      carKm: json['carKm'] as int?,
      carDescription: json['carDescription'] as String?,
      carLicencePhotoUrl: json['carLicencePhotoUrl'] as String?,
      carCommentCount: json['carCommentCount'] as int?,
      carLikeCount: json['carLikeCount'] as int?,
      postDate: json['postDate'] as String?,
      profile_img_url: json['profile_img_url'] as String?,
    );

Map<String, dynamic> _$CarsToJson(Cars instance) => <String, dynamic>{
      'carOwnerEmail': instance.carOwnerEmail,
      'carPlate': instance.carPlate,
      'carBrand': instance.carBrand,
      'carPhotoUrl': instance.carPhotoUrl,
      'isCarSale': instance.isCarSale,
      'carKm': instance.carKm,
      'carDescription': instance.carDescription,
      'carLicencePhotoUrl': instance.carLicencePhotoUrl,
      'carCommentCount': instance.carCommentCount,
      'carLikeCount': instance.carLikeCount,
      'postDate': instance.postDate,
      'profile_img_url': instance.profile_img_url,
    };
