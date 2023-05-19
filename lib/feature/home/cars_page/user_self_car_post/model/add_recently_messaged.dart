// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'add_recently_messaged.g.dart';

@JsonSerializable()
class AddRecentlyMessaged {
  String? qrType;
  String? displayQrData;
  String? qrData;
  String? qrScanGen;

  AddRecentlyMessaged({
    this.qrType,
    this.displayQrData,
    this.qrData,
    this.qrScanGen,
  });

  factory AddRecentlyMessaged.fromJson(Map<String, dynamic> json) {
    return _$AddRecentlyMessagedFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddRecentlyMessagedToJson(this);
  }
}
