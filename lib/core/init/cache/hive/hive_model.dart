import 'package:hive_flutter/adapters.dart';

abstract class IHivecacheManager<T> {
  final String key;
  Box<T>? box;

  IHivecacheManager(this.key);
  Future<void> init() async {
    registerAdaptor();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(key);
    }
  }

  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);
  T? getItem(String key);
  Future putItem(String key, T model);
  Future<void> removeItem(String key);
  List<T>? getValues();
  Future<void> clearAll() async {
    await box?.clear();
  }

  void registerAdaptor();
}
