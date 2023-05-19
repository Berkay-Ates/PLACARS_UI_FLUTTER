// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recently_messaged.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRecentlyMessaged _$AddRecentlyMessagedFromJson(Map<String, dynamic> json) =>
    AddRecentlyMessaged(
      qrType: json['qrType'] as String?,
      displayQrData: json['displayQrData'] as String?,
      qrData: json['qrData'] as String?,
      qrScanGen: json['qrScanGen'] as String?,
    );

Map<String, dynamic> _$AddRecentlyMessagedToJson(
        AddRecentlyMessaged instance) =>
    <String, dynamic>{
      'qrType': instance.qrType,
      'displayQrData': instance.displayQrData,
      'qrData': instance.qrData,
      'qrScanGen': instance.qrScanGen,
    };
