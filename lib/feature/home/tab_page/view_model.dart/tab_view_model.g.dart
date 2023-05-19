// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlacarsTabViewModel on _PlacarsTabViewModelBase, Store {
  late final _$currentIndexAtom =
      Atom(name: '_PlacarsTabViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$_PlacarsTabViewModelBaseActionController =
      ActionController(name: '_PlacarsTabViewModelBase', context: context);

  @override
  void setCurrentPageIndex(int i) {
    final _$actionInfo = _$_PlacarsTabViewModelBaseActionController.startAction(
        name: '_PlacarsTabViewModelBase.setCurrentPageIndex');
    try {
      return super.setCurrentPageIndex(i);
    } finally {
      _$_PlacarsTabViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
