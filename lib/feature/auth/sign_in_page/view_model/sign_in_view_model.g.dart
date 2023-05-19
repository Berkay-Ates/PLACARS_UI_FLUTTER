// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInViewModel on _SignInViewModelBase, Store {
  late final _$passwordLoginVisibilityAtom = Atom(
      name: '_SignInViewModelBase.passwordLoginVisibility', context: context);

  @override
  bool get passwordLoginVisibility {
    _$passwordLoginVisibilityAtom.reportRead();
    return super.passwordLoginVisibility;
  }

  @override
  set passwordLoginVisibility(bool value) {
    _$passwordLoginVisibilityAtom
        .reportWrite(value, super.passwordLoginVisibility, () {
      super.passwordLoginVisibility = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SignInViewModelBase.isLoading', context: context);

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

  late final _$signInUserAsyncAction =
      AsyncAction('_SignInViewModelBase.signInUser', context: context);

  @override
  Future<dynamic> signInUser() {
    return _$signInUserAsyncAction.run(() => super.signInUser());
  }

  late final _$_SignInViewModelBaseActionController =
      ActionController(name: '_SignInViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePasswordVisibility() {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.changePasswordVisibility');
    try {
      return super.changePasswordVisibility();
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwordLoginVisibility: ${passwordLoginVisibility},
isLoading: ${isLoading}
    ''';
  }
}
