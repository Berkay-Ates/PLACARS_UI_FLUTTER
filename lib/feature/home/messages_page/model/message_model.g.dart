// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageProfileModel _$MessageProfileModelFromJson(Map<String, dynamic> json) =>
    MessageProfileModel(
      name: json['name'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      isActive: json['isActive'] as bool?,
      profileImgUrl: json['profileImgUrl'] as String?,
      email: json['email'] as String?,
      user_qr_data: (json['user_qr_data'] as List<dynamic>?)
          ?.map((e) => RecentlyMessaged.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageProfileModelToJson(
        MessageProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'phone': instance.phone,
      'isActive': instance.isActive,
      'profileImgUrl': instance.profileImgUrl,
      'email': instance.email,
      'user_qr_data': instance.user_qr_data,
    };

RecentlyMessaged _$RecentlyMessagedFromJson(Map<String, dynamic> json) =>
    RecentlyMessaged(
      displayQrData: json['displayQrData'] as String?,
      profile_img_url: json['qrData'] as String?,
    );

Map<String, dynamic> _$RecentlyMessagedToJson(RecentlyMessaged instance) =>
    <String, dynamic>{
      'displayQrData': instance.displayQrData,
      'qrData': instance.profile_img_url,
    };
