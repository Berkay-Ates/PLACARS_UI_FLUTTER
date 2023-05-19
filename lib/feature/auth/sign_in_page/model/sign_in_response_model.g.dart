// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInModelResponse _$SignInModelResponseFromJson(Map<String, dynamic> json) =>
    SignInModelResponse(
      access: json['access'] as String?,
      isAcitve: json['isAcitve'] as bool?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      profile_img_url: json['profile_img_url'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$SignInModelResponseToJson(
        SignInModelResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'isAcitve': instance.isAcitve,
      'name': instance.name,
      'email': instance.email,
      'access': instance.access,
      'profile_img_url': instance.profile_img_url,
    };
