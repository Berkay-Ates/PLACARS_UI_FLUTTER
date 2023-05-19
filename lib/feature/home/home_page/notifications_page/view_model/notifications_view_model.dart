import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../../core/base/view_model/base_view_model.dart';
import '../../../../../product/enums/home_post_enums.dart';
part 'notifications_view_model.g.dart';

class NotificationsViewModel = _NotificationsViewModelBase with _$NotificationsViewModel;

abstract class _NotificationsViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}
}
