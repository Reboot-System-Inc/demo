import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/auth/loggedin_provider.dart';
import '../../../application/auth/auth_provider.dart';
import '../../../utils/utils.dart';
import '../signup/signup.dart';

class LoginScreen extends HookConsumerWidget {
  static String route = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authProvider,
      (previous, next) {
        if (previous!.loading == true && next.loading == false) {
          BotToast.closeAllLoading();
        } else {
          BotToast.showLoading();
        }
      },
    );

    return Scaffold(
      backgroundColor: ColorPalate.white,
      appBar: AppBar(
        backgroundColor: ColorPalate.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              context.local.login.toWordTitleCase(),
              style: CustomTextStyle.textStyle32w600,
            ),
            gap20,
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
              child: Text(
                context.local.loginBelowText,
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: ColorPalate.black,
                ),
              ),
            ),
            gap48,
            FilledButton(
              child: Text(context.local.login),
              onPressed: () {
                ref.read(loggedInProvider.notifier).changeToken("token");
              },
            ),
            gap48,
            FilledButton(
              child: Text(context.local.signup),
              onPressed: () {
                context.go(SignupScreen.route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
