// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationsViewModel on _NotificationsViewModelBase, Store {
  late final _$switchListTileValueAtom = Atom(
      name: '_NotificationsViewModelBase.switchListTileValue',
      context: context);

  @override
  bool? get switchListTileValue {
    _$switchListTileValueAtom.reportRead();
    return super.switchListTileValue;
  }

  @override
  set switchListTileValue(bool? value) {
    _$switchListTileValueAtom.reportWrite(value, super.switchListTileValue, () {
      super.switchListTileValue = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_NotificationsViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_NotificationsViewModelBaseActionController =
      ActionController(name: '_NotificationsViewModelBase', context: context);

  @override
  void changeNotificationsRejYes(bool value) {
    final _$actionInfo =
        _$_NotificationsViewModelBaseActionController.startAction(
            name: '_NotificationsViewModelBase.changeNotificationsRejYes');
    try {
      return super.changeNotificationsRejYes(value);
    } finally {
      _$_NotificationsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_NotificationsViewModelBaseActionController
        .startAction(name: '_NotificationsViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_NotificationsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
switchListTileValue: ${switchListTileValue},
isLoading: ${isLoading}
    ''';
  }
}
