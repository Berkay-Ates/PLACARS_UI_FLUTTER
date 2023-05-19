import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/product/backend/backend_endpoints.dart';
import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../../add_car_page/view/car_add_view.dart';
import '../../home_page/model/car_home_post_model.dart';
import '../user_self_car_post/view/user_self_car_post.dart';
part 'my_cars_view_model.g.dart';

class MyCarsViewModel = _MyCarsViewModelBase with _$MyCarsViewModel;

abstract class _MyCarsViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  String licencePlateUrl =
      "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/download.png?alt=media";

  String carUrl = "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/images.png?alt=media";

  @observable
  List<Cars> carLists = [];

  @observable
  bool isloading = false;

  @observable
  int itemCounts = 5;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    initHive();
  }

  @action
  void changeLoading() {
    isloading = !isloading;
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

  Future<Object> navigateToCarAdd() async {
    return await Navigator.push(baseContext, MaterialPageRoute(builder: (context) => const CarAddView()));
  }

  @action
  Future getMyCars() async {
    appService?.dio.options.headers['Authorization'] = 'Bearer ${userHiveModel?.token}';
    final response = await appService?.dio.get(BackendURLs.CAR_LISTS);
    if (response?.statusCode == HttpStatus.ok) {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        carLists = CarListModel.fromJson(data).cars ?? [];
      }
    }
  }

  @action
  void changeItemCount() {
    itemCounts = 3;
  }

  void popDeleteWidget() {
    Navigator.pop(baseContext);
  }

  void navigateToUserSelfCarPost(Cars cars) {
    Navigator.push(baseContext, MaterialPageRoute(builder: (context) => UserSelfCarPostView(cars: cars)));
  }
}
