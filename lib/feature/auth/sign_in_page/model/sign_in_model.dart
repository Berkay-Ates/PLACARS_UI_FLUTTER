import 'package:json_annotation/json_annotation.dart';

part "sign_in_model.g.dart";

@JsonSerializable()
class SignInModel {
  String? email;
  String? password;

  SignInModel({this.email, this.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return _$SignInModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInModelToJson(this);
  }
}
