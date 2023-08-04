import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';
// import '../signup/signup.dart';

class ResetPasswordScreen extends HookConsumerWidget {
  static String route = "/resetPassword";
  const ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final emailController = useTextEditingController();
    return Scaffold(
      backgroundColor: ColorPalate.white,
      appBar: AppBar(
        backgroundColor: ColorPalate.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Text(
              "context.local.resetPassword.toTitleCase()",
              style: CustomTextStyle.textStyle16w600,
            ),
            gap20,
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 40, 0),
              child: Text(
                "context.local.resetPasswordBelowText",
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: ColorPalate.black,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Hero(
        tag: "bottomSheet",
        child: IntrinsicHeight(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.fromSTEB(20.w, 0, 20.w, 0),
              child: Material(
                child: Column(
                  children: [
                    gap36,
                    KTextFormField(
                      hintText: "context.local.email",
                      controller: emailController,
                    ),
                    gap24,
                    KElevatedButton(
                      backgroundColor: context.color.secondary,
                      onPressed: () {
                        // context.push(EmailSentScreen.route);
                      },
                      text: " context.local.sendMail",
                    ),
                    Gap(68.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
