// ignore_for_file: unused_element

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/strings.dart';

final hiveProvider = Provider<StorageHandler>((_) => StorageHandler());

class StorageHandler {
  StorageHandler._();
  // static final StorageHandler _instance = StorageHandler._();
  // static StorageHandler get instance => _instance;

  late Box _cacheBox;

  StorageHandler() {
    // _init();
  }

  // Future<void> create() async {
  //   await instance._init();
  // }

  Future<void> init(String baxName) async {
    await Hive.initFlutter();
    _cacheBox = await Hive.openBox(KStrings.cacheBox);
  }

  dynamic get(String tag, {dynamic defaultValue}) {
    return _cacheBox.get(tag, defaultValue: defaultValue);
  }

  void put(String tag, dynamic value) {
    _cacheBox.put(tag, value);
  }

  void delete(String tag) {
    _cacheBox.delete(tag);
  }
}
