import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../product/backend/backend_endpoints.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../car_post_detail_page/view/car_post_detail_view.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../product/enums/home_post_enums.dart';
import '../model/car_home_post_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  @observable
  HomePostEnums selectedPostCatgry = HomePostEnums.interestings;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @observable
  List<Cars> carLists = [];

  @observable
  bool isloading = false;

  @action
  void changeLoading() {
    isloading = !isloading;
  }

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
    changeLoading();
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
    try {
      await getMyCars();
      changeLoading();
    } catch (e) {
      inspect(e);
      changeLoading();
    }
  }

  @action
  void changePostCategory(HomePostEnums value) {
    if (value != selectedPostCatgry) {
      selectedPostCatgry = value;
    }
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
  Future getMyCars() async {
    appService?.dio.options.headers['Authorization'] = 'Bearer ${userHiveModel?.token}';
    final response = await appService?.dio.get(BackendURLs.GET_ALL_CARS_LISTS);
    if (response?.statusCode == HttpStatus.ok) {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        carLists = CarListModel.fromJson(data).cars ?? [];
      }
    }
  }

  void navigateToCarPostView(Cars cars) {
    Navigator.push(baseContext, MaterialPageRoute(builder: (context) => CarPostDetailView(cars: cars)));
  }
}
