import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageProfileModel {
  String? name;
  String? username;
  String? phone;
  bool? isActive;
  String? profileImgUrl;
  String? email;
  List<RecentlyMessaged>? user_qr_data;

  MessageProfileModel({
    this.name,
    this.username,
    this.phone,
    this.isActive,
    this.profileImgUrl,
    this.email,
    this.user_qr_data,
  });

  factory MessageProfileModel.fromJson(Map<String, dynamic> json) {
    return _$MessageProfileModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MessageProfileModelToJson(this);
  }
}

@JsonSerializable()
class RecentlyMessaged {
  String? displayQrData;
  @JsonKey(name: "qrData")
  String? profile_img_url;

  RecentlyMessaged({this.displayQrData, this.profile_img_url});

  factory RecentlyMessaged.fromJson(Map<String, dynamic> json) {
    return _$RecentlyMessagedFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecentlyMessagedToJson(this);
  }
}
