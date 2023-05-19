import 'package:json_annotation/json_annotation.dart';

part 'registeration_model.g.dart';

@JsonSerializable()
class RegisterationModel {
  String? access;

  RegisterationModel({this.access});

  factory RegisterationModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterationModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterationModelToJson(this);
  }
}
