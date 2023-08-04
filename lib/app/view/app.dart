import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/auth/auth_provider.dart';
import '../../application/auth/loggedin_provider.dart';
import '../../application/global.dart';
import '../../route/go_router.dart';
import '../../theme/theme.dart';
import '../../utils/dismiss_keyboard.dart';
import '../../utils/strings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final appTheme = ref.watch(themeProvider);
    final user = ref.watch(loggedInProvider.notifier).user;

    useEffect(() {
      Future.wait([
        Future.microtask(
          () => ref.read(authProvider.notifier).setUser(user),
        ),
        // Future.microtask(
        //     () => ref.read(loggedInProvider.notifier).onAppStart()),
        // Future.microtask(
        //     () => ref.read(loggedInProvider.notifier).isLoggedIn()),
      ]);

      return null;
    }, []);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return DismissKeyboard(
          child: MaterialApp.router(
            title: KStrings.appName,
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
            scrollBehavior: const ScrollBehavior()
                .copyWith(physics: const BouncingScrollPhysics()),
            //: Router
            routerConfig: router,
            //:BotToast
            builder: BotToastInit(),

            //:localization
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: ref.watch(appLocalProvider),

            //:theme
            themeMode: appTheme.theme.isEmpty
                ? ThemeMode.system
                : appTheme.theme == "dark"
                    ? ThemeMode.dark
                    : ThemeMode.light,

            theme: MyTheme.lightTheme,
            darkTheme: MyTheme.darkTheme,
          ),
        );
      },
    );
  }
}
