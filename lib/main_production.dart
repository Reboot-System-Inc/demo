import 'package:flutter/material.dart';

import 'app/view/app.dart';
import 'bootstrap.dart';
import 'flavor/flavor.dart';

void main() {
  final devConfig = EnvConfig(
    // appName: 'KStrings.appname',
    appName: 'app-name',
    shouldCollectCrashLog: true,
    // baseUrl: dotenv.env['BASEURL_PRODUCTION'],
    baseUrl: 'https://api.github.com/',
    // hiveBoxName: 'KStrings.prod_cache',
    hiveBoxName: 'hive_box_prod',
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: devConfig,
  );
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
