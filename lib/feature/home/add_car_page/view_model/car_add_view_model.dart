import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/constants/durations/app_durations.dart';
import '../../../../core/image_upload/image_upload_manager.dart';
import '../../cars_page/user_self_car_post/model/add_recently_messaged.dart';
import '../model/add_car_post_model.dart';
import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../product/backend/backend_endpoints.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../model/image_upload_response.dart';
part 'car_add_view_model.g.dart';

class CarrAddViewModel = _CarrAddViewModelBase with _$CarrAddViewModel;

abstract class _CarrAddViewModelBase with Store, BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? plakaController;
  TextEditingController? markaModelController;
  TextEditingController? kmTextController;
  TextEditingController? descriptionTextController;

  final imageUploadViewModel = LibraryImageUpload();

  @observable
  bool checkboxValue = false;

  @observable
  String licencePlateUrl =
      "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/download.png?alt=media";

  @observable
  String carUrl = "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/images.png?alt=media";

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    plakaController ??= TextEditingController();
    markaModelController ??= TextEditingController();
    kmTextController ??= TextEditingController();
    descriptionTextController ??= TextEditingController();
    initHive();
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  @action
  void setCarUrl(String imageUrl) {
    carUrl = imageUrl;
  }

  @action
  void setLicenceUrl(String imageUrl) {
    licencePlateUrl = imageUrl;
  }

  Future<String?> uploadImageToFirebase() async {
    final file = await imageUploadViewModel.fetch();
    if (file != null && (userHiveModel?.username?.isNotEmpty ?? false)) {
      final uploadFile = File(file.path);
      final uploadResponse = await uploadToImageServer(uploadFile, file.name);
      return "${BackendURLs.IMAGE_UPLOAD}${uploadResponse?.name}?alt=media";
    }
    return null;
  }

  Future<ImageUploadResponse?> uploadToImageServer(File file, String name,
      {void Function(int, int)? onSendProgress}) async {
    // https://firebasestorage.googleapis.com/v0/b/flash-chat-8756d.appspot.com/o/ --Base
    // /full%2F --directory
    // 2Screen%20Shot%202022-09-23%20at%2022.08.18.png --filename
    var formData = FormData.fromMap({'file': await MultipartFile.fromFile(file.path)});

    final response =
        await appService?.dio.post('${BackendURLs.IMAGE_UPLOAD}$name', data: formData, onSendProgress: onSendProgress);

    if (response?.statusCode == HttpStatus.ok) {
      return ImageUploadResponse.fromJson(response?.data);
    }
    return null;
  }

  @action
  void changeCarSaleCheckboxValue(bool? value) {
    if (value != null) {
      checkboxValue = value;
    }
  }

  @action
  String? textFieldsValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.add_car_page_warn_txt.translate;
    }
    return null;
  }

  @action
  Future addCar() async {
    if (formKey.currentState?.validate() ?? false) {
      final AddCarPostModel addCarPostModel = AddCarPostModel(
        plakaController?.text,
        markaModelController?.text,
        carUrl,
        licencePlateUrl,
        "True",
        checkboxValue ? "True" : "False",
        kmTextController?.text,
        descriptionTextController?.text,
        0,
        0,
      );

      appService?.dio.options.headers['Authorization'] = 'Bearer ${userHiveModel?.token}';
      final response = await appService?.dio.post(
        BackendURLs.CREATE_CAR,
        data: addCarPostModel.toJson(),
      );

      if (response?.statusCode == HttpStatus.created) {
        await addRecentlyMessaged(plakaController?.text ?? "", carUrl);
        showSnackS();
        await Future.delayed(AppDurations.durationLow);
        navigateToCarAddPage(true);
      }
    }
  }

  Future<void> addRecentlyMessaged(String plate, String carPhotourl) async {
    final recentlyMessaged =
        AddRecentlyMessaged(qrType: "email", displayQrData: plate, qrData: carPhotourl, qrScanGen: "generated");
    const token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDY1MGM4ODI4NDRmYjI0MmZhMTRhMzciLCJuYW1lIjoiZGVuZW1lIiwiZW1haWwiOiJoZWxsb29AZ21haWwuY29tIiwiaWF0IjoxNjg0MzQzOTU1LCJleHAiOjE2ODY5MzU5NTV9.8XlLZyR8lHY1CCyr22p6zrlU4mDE5GYWZFc1nXJrgLc";
    //appService?.dio.options.headers['Authorization'] = 'Bearer ${userHiveModel?.token}';
    final response = await appService?.dio.post(
      BackendURLs.ADD_RECENTLY_MESSAGED,
      options: Options(headers: {"Authorization": token}),
      data: recentlyMessaged.toJson(),
    );
  }

  void navigateToCarAddPage(bool val) {
    Navigator.pop(baseContext, val);
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        "Yeni araç ekleme işlemi başarıyla sonuçlanmıştır.",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.onSurface,
    ));
  }

  void showSnackSError() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        "Yeni araç ekleme işlemi başarılamadı sonra tekrar dene",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  void dispose() {
    plakaController?.dispose();
    markaModelController?.dispose();
    kmTextController?.dispose();
    descriptionTextController?.dispose();
  }
}
