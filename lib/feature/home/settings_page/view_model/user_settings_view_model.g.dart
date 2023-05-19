// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserSettingsViewModel on _UserSettingsViewModelBase, Store {
  late final _$switchValueAtom =
      Atom(name: '_UserSettingsViewModelBase.switchValue', context: context);

  @override
  bool get switchValue {
    _$switchValueAtom.reportRead();
    return super.switchValue;
  }

  @override
  set switchValue(bool value) {
    _$switchValueAtom.reportWrite(value, super.switchValue, () {
      super.switchValue = value;
    });
  }

  late final _$userHiveModelAtom =
      Atom(name: '_UserSettingsViewModelBase.userHiveModel', context: context);

  @override
  UserHiveModel? get userHiveModel {
    _$userHiveModelAtom.reportRead();
    return super.userHiveModel;
  }

  @override
  set userHiveModel(UserHiveModel? value) {
    _$userHiveModelAtom.reportWrite(value, super.userHiveModel, () {
      super.userHiveModel = value;
    });
  }

  late final _$initHiveAsyncAction =
      AsyncAction('_UserSettingsViewModelBase.initHive', context: context);

  @override
  Future<dynamic> initHive() {
    return _$initHiveAsyncAction.run(() => super.initHive());
  }

  late final _$changeThemeAsyncAction =
      AsyncAction('_UserSettingsViewModelBase.changeTheme', context: context);

  @override
  Future<void> changeTheme(bool newValue) {
    return _$changeThemeAsyncAction.run(() => super.changeTheme(newValue));
  }

  late final _$_UserSettingsViewModelBaseActionController =
      ActionController(name: '_UserSettingsViewModelBase', context: context);

  @override
  void readTheme() {
    final _$actionInfo = _$_UserSettingsViewModelBaseActionController
        .startAction(name: '_UserSettingsViewModelBase.readTheme');
    try {
      return super.readTheme();
    } finally {
      _$_UserSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
switchValue: ${switchValue},
userHiveModel: ${userHiveModel}
    ''';
  }
}
