import 'package:hive_flutter/adapters.dart';

import '../enums/hive_constants.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: HiveConstant.userHiveID)
class UserHiveModel {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final String? name;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  final String? profileImgUrl;
  @HiveField(5)
  final String? token;

  UserHiveModel(this.id, this.username, this.name, this.email, this.profileImgUrl, this.token);
}
