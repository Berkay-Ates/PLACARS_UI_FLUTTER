// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessagesViewModel on _MessagesViewModelBase, Store {
  late final _$recentlyMessgedAtom =
      Atom(name: '_MessagesViewModelBase.recentlyMessged', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_MessagesViewModelBase.isLoading', context: context);

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

  @override
  ObservableFuture<void> getUserMessagedPersons() {
    final _$future = super.getUserMessagedPersons();
    return ObservableFuture<void>(_$future, context: context);
  }

  late final _$_MessagesViewModelBaseActionController =
      ActionController(name: '_MessagesViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MessagesViewModelBaseActionController.startAction(
        name: '_MessagesViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MessagesViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recentlyMessged: ${recentlyMessged},
isLoading: ${isLoading}
    ''';
  }
}
