// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verify_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmailVerifyViewModel on _EmailVerifyViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EmailVerifyViewModelBase.isLoading', context: context);

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

  late final _$emailAtom =
      Atom(name: '_EmailVerifyViewModelBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$isMailVerifiedAsyncAction =
      AsyncAction('_EmailVerifyViewModelBase.isMailVerified', context: context);

  @override
  Future<dynamic> isMailVerified() {
    return _$isMailVerifiedAsyncAction.run(() => super.isMailVerified());
  }

  late final _$_EmailVerifyViewModelBaseActionController =
      ActionController(name: '_EmailVerifyViewModelBase', context: context);

  @override
  void setMail() {
    final _$actionInfo = _$_EmailVerifyViewModelBaseActionController
        .startAction(name: '_EmailVerifyViewModelBase.setMail');
    try {
      return super.setMail();
    } finally {
      _$_EmailVerifyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoading() {
    final _$actionInfo = _$_EmailVerifyViewModelBaseActionController
        .startAction(name: '_EmailVerifyViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_EmailVerifyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
email: ${email}
    ''';
  }
}
