import 'package:flutter/cupertino.dart';

import 'app/view/app.dart';
import 'bootstrap.dart';
import 'flavor/flavor.dart';

void main() {
  final devConfig = EnvConfig(
    appName: 'app-name-dev',
    shouldCollectCrashLog: true,
    // baseUrl: dotenv.env['BASEURL_DEVELOPMENT'],
    baseUrl: 'https://api.github.com/',
    // hiveBoxName: 'KStrings.dev_cache',
    hiveBoxName: 'hive_box_dev',
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const App());
}
