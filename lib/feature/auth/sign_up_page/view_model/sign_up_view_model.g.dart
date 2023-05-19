// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  late final _$passwordCreateVisibilityAtom = Atom(
      name: '_SignUpViewModelBase.passwordCreateVisibility', context: context);

  @override
  bool get passwordCreateVisibility {
    _$passwordCreateVisibilityAtom.reportRead();
    return super.passwordCreateVisibility;
  }

  @override
  set passwordCreateVisibility(bool value) {
    _$passwordCreateVisibilityAtom
        .reportWrite(value, super.passwordCreateVisibility, () {
      super.passwordCreateVisibility = value;
    });
  }

  late final _$passwordConfirmVisibilityAtom = Atom(
      name: '_SignUpViewModelBase.passwordConfirmVisibility', context: context);

  @override
  bool get passwordConfirmVisibility {
    _$passwordConfirmVisibilityAtom.reportRead();
    return super.passwordConfirmVisibility;
  }

  @override
  set passwordConfirmVisibility(bool value) {
    _$passwordConfirmVisibilityAtom
        .reportWrite(value, super.passwordConfirmVisibility, () {
      super.passwordConfirmVisibility = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SignUpViewModelBase.isLoading', context: context);

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

  late final _$signUpUserAsyncAction =
      AsyncAction('_SignUpViewModelBase.signUpUser', context: context);

  @override
  Future<dynamic> signUpUser() {
    return _$signUpUserAsyncAction.run(() => super.signUpUser());
  }

  late final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase', context: context);

  @override
  void changePasswordsVisibility() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.changePasswordsVisibility');
    try {
      return super.changePasswordsVisibility();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordCreateVisibility: ${passwordCreateVisibility},
passwordConfirmVisibility: ${passwordConfirmVisibility},
isLoading: ${isLoading}
    ''';
  }
}
