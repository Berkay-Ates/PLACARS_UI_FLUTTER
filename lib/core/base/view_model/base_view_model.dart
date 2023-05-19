import 'package:flutter/material.dart';
import 'package:placars_savt/core/init/network/service/app_service.dart';

abstract class BaseViewModel {
  AppService? appService = AppService.instance;
  late BuildContext baseContext;

  void setContext(BuildContext context);
  void init();
}
