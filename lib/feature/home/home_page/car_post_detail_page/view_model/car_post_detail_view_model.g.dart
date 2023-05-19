// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_post_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarPostDetailViewModel on _CarPostDetailViewModelBase, Store {
  late final _$isloadingAtom =
      Atom(name: '_CarPostDetailViewModelBase.isloading', context: context);

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  late final _$textControllerAtom = Atom(
      name: '_CarPostDetailViewModelBase.textController', context: context);

  @override
  TextEditingController? get textController {
    _$textControllerAtom.reportRead();
    return super.textController;
  }

  @override
  set textController(TextEditingController? value) {
    _$textControllerAtom.reportWrite(value, super.textController, () {
      super.textController = value;
    });
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('_CarPostDetailViewModelBase.sendMessage', context: context);

  @override
  Future<dynamic> sendMessage(String? message, String plate) {
    return _$sendMessageAsyncAction
        .run(() => super.sendMessage(message, plate));
  }

  late final _$_CarPostDetailViewModelBaseActionController =
      ActionController(name: '_CarPostDetailViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_CarPostDetailViewModelBaseActionController
        .startAction(name: '_CarPostDetailViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_CarPostDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void scrollToBottom() {
    final _$actionInfo = _$_CarPostDetailViewModelBaseActionController
        .startAction(name: '_CarPostDetailViewModelBase.scrollToBottom');
    try {
      return super.scrollToBottom();
    } finally {
      _$_CarPostDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String tarihiDuzenle(String tarih) {
    final _$actionInfo = _$_CarPostDetailViewModelBaseActionController
        .startAction(name: '_CarPostDetailViewModelBase.tarihiDuzenle');
    try {
      return super.tarihiDuzenle(tarih);
    } finally {
      _$_CarPostDetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
textController: ${textController}
    ''';
  }
}
