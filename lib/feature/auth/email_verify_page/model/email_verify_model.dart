import 'package:json_annotation/json_annotation.dart';

part 'email_verify_model.g.dart';

@JsonSerializable()
class EmailVerifyModel {
  bool? exist;

  EmailVerifyModel({this.exist});

  factory EmailVerifyModel.fromJson(Map<String, dynamic> json) {
    return _$EmailVerifyModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EmailVerifyModelToJson(this);
  }
}
