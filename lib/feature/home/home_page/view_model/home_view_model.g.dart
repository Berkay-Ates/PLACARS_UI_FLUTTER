// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$selectedPostCatgryAtom =
      Atom(name: '_HomeViewModelBase.selectedPostCatgry', context: context);

  @override
  HomePostEnums get selectedPostCatgry {
    _$selectedPostCatgryAtom.reportRead();
    return super.selectedPostCatgry;
  }

  @override
  set selectedPostCatgry(HomePostEnums value) {
    _$selectedPostCatgryAtom.reportWrite(value, super.selectedPostCatgry, () {
      super.selectedPostCatgry = value;
    });
  }

  late final _$carListsAtom =
      Atom(name: '_HomeViewModelBase.carLists', context: context);

  @override
  List<Cars> get carLists {
    _$carListsAtom.reportRead();
    return super.carLists;
  }

  @override
  set carLists(List<Cars> value) {
    _$carListsAtom.reportWrite(value, super.carLists, () {
      super.carLists = value;
    });
  }

  late final _$isloadingAtom =
      Atom(name: '_HomeViewModelBase.isloading', context: context);

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

  late final _$getMyCarsAsyncAction =
      AsyncAction('_HomeViewModelBase.getMyCars', context: context);

  @override
  Future<dynamic> getMyCars() {
    return _$getMyCarsAsyncAction.run(() => super.getMyCars());
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePostCategory(HomePostEnums value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changePostCategory');
    try {
      return super.changePostCategory(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String tarihiDuzenle(String tarih) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.tarihiDuzenle');
    try {
      return super.tarihiDuzenle(tarih);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedPostCatgry: ${selectedPostCatgry},
carLists: ${carLists},
isloading: ${isloading}
    ''';
  }
}
