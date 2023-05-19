// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;
  @JsonKey(name: "profile_img_url")
  final String? profileImgUrl;

  SignUpModel({
    this.username,
    this.name,
    this.email,
    this.password,
    this.profileImgUrl,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return _$SignUpModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignUpModelToJson(this);
  }
}
