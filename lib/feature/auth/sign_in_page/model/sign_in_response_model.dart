import 'package:json_annotation/json_annotation.dart';

part "sign_in_response_model.g.dart";

@JsonSerializable()
class SignInModelResponse {
  String? username;
  bool? isAcitve;
  String? name;
  String? email;
  String? access;
  // ignore: non_constant_identifier_names
  String? profile_img_url;

  SignInModelResponse({this.access, this.isAcitve, this.email, this.name, this.profile_img_url, this.username});

  factory SignInModelResponse.fromJson(Map<String, dynamic> json) {
    return _$SignInModelResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInModelResponseToJson(this);
  }
}
