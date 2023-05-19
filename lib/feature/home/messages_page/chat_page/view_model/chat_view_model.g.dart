// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatViewModel on _ChatViewModelBase, Store {
  late final _$isloadingAtom =
      Atom(name: '_ChatViewModelBase.isloading', context: context);

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

  late final _$textControllerAtom =
      Atom(name: '_ChatViewModelBase.textController', context: context);

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

  late final _$recentlyMessgedAtom =
      Atom(name: '_ChatViewModelBase.recentlyMessged', context: context);

  @override
  List<RecentlyMessaged> get recentlyMessged {
    _$recentlyMessgedAtom.reportRead();
    return super.recentlyMessged;
  }

  @override
  set recentlyMessged(List<RecentlyMessaged> value) {
    _$recentlyMessgedAtom.reportWrite(value, super.recentlyMessged, () {
      super.recentlyMessged = value;
    });
  }

  late final _$sendMessageAsyncAction =
      AsyncAction('_ChatViewModelBase.sendMessage', context: context);

  @override
  Future<dynamic> sendMessage(String? message) {
    return _$sendMessageAsyncAction.run(() => super.sendMessage(message));
  }

  late final _$_ChatViewModelBaseActionController =
      ActionController(name: '_ChatViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_ChatViewModelBaseActionController.startAction(
        name: '_ChatViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ChatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void scrollToBottom() {
    final _$actionInfo = _$_ChatViewModelBaseActionController.startAction(
        name: '_ChatViewModelBase.scrollToBottom');
    try {
      return super.scrollToBottom();
    } finally {
      _$_ChatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isloading: ${isloading},
textController: ${textController},
recentlyMessged: ${recentlyMessged}
    ''';
  }
}
