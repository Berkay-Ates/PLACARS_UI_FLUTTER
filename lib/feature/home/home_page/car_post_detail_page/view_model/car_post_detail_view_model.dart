import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../../core/base/view_model/base_view_model.dart';
import '../../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../../core/init/cache/hive/hive_model.dart';
import '../../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../../product/hive_models/user_hive_model.dart';
part 'car_post_detail_view_model.g.dart';

class CarPostDetailViewModel = _CarPostDetailViewModelBase with _$CarPostDetailViewModel;

abstract class _CarPostDetailViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  final firestore = FirebaseFirestore.instance;

  final String chatCarPlate = "47 ADC 77";

  final controller = ScrollController();

  @observable
  bool isloading = false;

  @observable
  TextEditingController? textController;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

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

  @action
  void changeLoading() {
    isloading = !isloading;
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  @action
  void scrollToBottom() {
    controller.jumpTo(controller.position.minScrollExtent);
  }

  String formatDate(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
  }

  String setUserName(String firebaseSender, String carOwner) {
    return userHiveModel?.email == firebaseSender
        ? "Sen"
        : userHiveModel?.email == carOwner
            ? "Arabanın Sahibi"
            : firebaseSender;
  }

  @action
  String tarihiDuzenle(String tarih) {
    DateTime dt = DateTime.parse(tarih);
    String gun = dt.day.toString().padLeft(2, '0');
    String ay = dt.month.toString().padLeft(2, '0');
    String yil = dt.year.toString();
    return "$gun.$ay.$yil";
  }

  @action
  Future sendMessage(String? message, String plate) async {
    if (message != null && message.isNotEmpty && (userHiveModel?.email?.isNotEmpty ?? false)) {
      if (userHiveModel?.profileImgUrl?.isNotEmpty ?? false) {
        await firestore.collection(plate).add(
          {
            "text": message,
            "timestamp": DateTime.now(),
            "sender": userHiveModel?.email,
            "sender_image_url": userHiveModel?.profileImgUrl
          },
        );
      }
    }
  }
}
