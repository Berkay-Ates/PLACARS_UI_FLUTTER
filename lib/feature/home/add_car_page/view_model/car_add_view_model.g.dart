// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_add_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarrAddViewModel on _CarrAddViewModelBase, Store {
  late final _$checkboxValueAtom =
      Atom(name: '_CarrAddViewModelBase.checkboxValue', context: context);

  @override
  bool get checkboxValue {
    _$checkboxValueAtom.reportRead();
    return super.checkboxValue;
  }

  @override
  set checkboxValue(bool value) {
    _$checkboxValueAtom.reportWrite(value, super.checkboxValue, () {
      super.checkboxValue = value;
    });
  }

  late final _$licencePlateUrlAtom =
      Atom(name: '_CarrAddViewModelBase.licencePlateUrl', context: context);

  @override
  String get licencePlateUrl {
    _$licencePlateUrlAtom.reportRead();
    return super.licencePlateUrl;
  }

  @override
  set licencePlateUrl(String value) {
    _$licencePlateUrlAtom.reportWrite(value, super.licencePlateUrl, () {
      super.licencePlateUrl = value;
    });
  }

  late final _$carUrlAtom =
      Atom(name: '_CarrAddViewModelBase.carUrl', context: context);

  @override
  String get carUrl {
    _$carUrlAtom.reportRead();
    return super.carUrl;
  }

  @override
  set carUrl(String value) {
    _$carUrlAtom.reportWrite(value, super.carUrl, () {
      super.carUrl = value;
    });
  }

  late final _$addCarAsyncAction =
      AsyncAction('_CarrAddViewModelBase.addCar', context: context);

  @override
  Future<dynamic> addCar() {
    return _$addCarAsyncAction.run(() => super.addCar());
  }

  late final _$_CarrAddViewModelBaseActionController =
      ActionController(name: '_CarrAddViewModelBase', context: context);

  @override
  void setCarUrl(String imageUrl) {
    final _$actionInfo = _$_CarrAddViewModelBaseActionController.startAction(
        name: '_CarrAddViewModelBase.setCarUrl');
    try {
      return super.setCarUrl(imageUrl);
    } finally {
      _$_CarrAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLicenceUrl(String imageUrl) {
    final _$actionInfo = _$_CarrAddViewModelBaseActionController.startAction(
        name: '_CarrAddViewModelBase.setLicenceUrl');
    try {
      return super.setLicenceUrl(imageUrl);
    } finally {
      _$_CarrAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCarSaleCheckboxValue(bool? value) {
    final _$actionInfo = _$_CarrAddViewModelBaseActionController.startAction(
        name: '_CarrAddViewModelBase.changeCarSaleCheckboxValue');
    try {
      return super.changeCarSaleCheckboxValue(value);
    } finally {
      _$_CarrAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? textFieldsValidator(String? value) {
    final _$actionInfo = _$_CarrAddViewModelBaseActionController.startAction(
        name: '_CarrAddViewModelBase.textFieldsValidator');
    try {
      return super.textFieldsValidator(value);
    } finally {
      _$_CarrAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkboxValue: ${checkboxValue},
licencePlateUrl: ${licencePlateUrl},
carUrl: ${carUrl}
    ''';
  }
}
