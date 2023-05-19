import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/backend/backend_endpoints.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../chat_page/view/chat_view.dart';
import '../../../../core/base/view_model/base_view_model.dart';
import '../model/message_model.dart';

part 'messages_view_model.g.dart';

class MessagesViewModel = _MessagesViewModelBase with _$MessagesViewModel;

abstract class _MessagesViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @observable
  List<RecentlyMessaged> recentlyMessged = [];

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    getUserMessagedPersons();
  }

  void navigateToChat(String plate) {
    Navigator.push(baseContext, MaterialPageRoute(builder: ((context) => ChatView(chattingPlate: plate))));
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  @observable
  Future<void> getUserMessagedPersons() async {
    changeLoading();
    const token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDY1MGM4ODI4NDRmYjI0MmZhMTRhMzciLCJuYW1lIjoiZGVuZW1lIiwiZW1haWwiOiJoZWxsb29AZ21haWwuY29tIiwiaWF0IjoxNjg0MzQzOTU1LCJleHAiOjE2ODY5MzU5NTV9.8XlLZyR8lHY1CCyr22p6zrlU4mDE5GYWZFc1nXJrgLc";

    try {
      //appService?.dio.options.headers['Authorization'] = 'Bearer ${userHiveModel?.token}';
      final response = await appService?.dio.get(
        BackendURLs.GET_ACCOUNT_VIA_EMAIL,
        options: Options(headers: {"Authorization": token}),
      );
      if (response?.data is Map<String, dynamic>) {
        recentlyMessged = MessageProfileModel.fromJson(response?.data).user_qr_data ?? [];
      }
      changeLoading();
    } catch (e) {
      inspect(e);
      changeLoading();
    }
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: Text(
        LocaleKeys.signIn_try_again_later.translate,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }
}
