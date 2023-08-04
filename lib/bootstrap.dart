// ignore_for_file: noop_primitive_operations

import 'dart:async';
import 'dart:developer';
import 'package:demo/theme/theme.dart';
import 'package:demo/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'application/local_storage/storage_handler.dart';
import 'flavor/build_config.dart';
import 'utils/network_util/network_handler.dart';

class ProviderLog extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger.i('''
{
  "PROVIDER": "${provider.name}; ${provider.runtimeType.toString()}"

}''');
    log('$newValue');
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final container = ProviderContainer(
    observers: [ProviderLog()],
  );

  Logger.init(
    true, // isEnable ，if production ，please false
    isShowFile: false, // In the IDE, whether the file name is displayed
    isShowTime: false, // In the IDE, whether the time is displayed
    levelDebug: 15,
    levelInfo: 10,
    levelWarn: 5,
    phoneVerbose: Colors.white,
    phoneDebug: const Color(0xff27AE60),
    phoneInfo: const Color(0xff2F80ED),
    phoneWarn: const Color(0xffE2B93B),
    phoneError: const Color(0xffEB5757),
  );

  final box = container.read(hiveProvider);

  // Add cross-flavor Hive BoxName
  final String boxName = BuildConfig.instance.config.hiveBoxName;
  await box.init(boxName);

  container.read(themeProvider);

  final String token = box.get(KStrings.token, defaultValue: '');

  // Add cross-flavor API BASE URL
  NetworkHandler.instance
    ..setup(baseUrl: BuildConfig.instance.config.baseUrl, showLogs: false)
    ..setToken(token);

  Logger.d('token: $token');

  runApp(
    ProviderScope(
      parent: container,
      observers: [ProviderLog()],
      child: await builder(),
    ),
  );
}
