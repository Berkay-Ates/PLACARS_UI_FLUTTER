import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../../core/base/view_model/base_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../../core/init/cache/hive/hive_model.dart';
import '../../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../../product/hive_models/user_hive_model.dart';
import '../../model/message_model.dart';
part 'chat_view_model.g.dart';

class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();
  final firestore = FirebaseFirestore.instance;

  final controller = ScrollController();

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  String? sender;
  String? plate;

  @observable
  bool isloading = false;

  @observable
  TextEditingController? textController;

  @observable
  List<RecentlyMessaged> recentlyMessged = [];

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    textController ??= TextEditingController();
    initHive();
  }

  void dispose() {
    textController?.dispose();
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
    sender = userHiveModel?.email;
  }

  void setChattingEmail(String email) {
    plate = email;
  }

  @action
  void changeLoading() {
    isloading = !isloading;
  }

  @action
  void scrollToBottom() {
    controller.jumpTo(controller.position.minScrollExtent);
  }

  String formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
  }

  @action
  Future sendMessage(String? message) async {
    if (message != null && message.isNotEmpty && sender != null && plate != null) {
      await firestore.collection(plate!).add({
        "sender_image_url": userHiveModel?.profileImgUrl,
        "text": message,
        "sender": userHiveModel?.email,
        "timestamp": DateTime.now(),
      });
    }
  }
}
