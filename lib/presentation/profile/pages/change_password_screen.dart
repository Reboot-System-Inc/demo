import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/utils.dart';
import '../../widgets/widgets.dart';

class ChangePasswordScreen extends HookConsumerWidget {
  static const route = '/change-password';

  const ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final reNewPasswordController = useTextEditingController();

    final reNewPasswordFocus = useFocusNode();
    final newPasswordFocus = useFocusNode();

    final formKey = useMemoized(GlobalKey<FormState>.new);
    return Scaffold(
      appBar: KAppBar(
        titleText: context.local.password,
        actions: [
          SizedBox(
            width: 80.w,
            child: TextButton(
              child: Text(
                context.local.save,
                style: CustomTextStyle.textStyle16w400secondary,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            padding: paddingH16,
            decoration: BoxDecoration(
              color: ColorPalate.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                gap24,
                KTextFormField2(
                  hintText: "context.local.currentPassword",
                  controller: currentPasswordController,
                  borderColor: ColorPalate.secondary,
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder()
                      .required()
                      .minLength(6)
                      .maxLength(50)
                      .build(),
                  onFieldSubmitted: (p0) {
                    newPasswordFocus.requestFocus();
                  },
                ),
                gap24,
                KTextFormField2(
                  hintText: "context.local.newPassword",
                  controller: newPasswordController,
                  borderColor: ColorPalate.secondary,
                  focusNode: newPasswordFocus,
                  textInputAction: TextInputAction.next,
                  validator: ValidationBuilder()
                      .required()
                      .minLength(6)
                      .maxLength(50)
                      .add((value) {
                    if (currentPasswordController.text ==
                        newPasswordController.text) {
                      return "context.local.notSame";
                    }
                    return null;
                  }).build(),
                  onFieldSubmitted: (p0) {
                    reNewPasswordFocus.requestFocus();
                  },
                ),
                gap24,
                KTextFormField2(
                  hintText: " context.local.retypeNewPassword",
                  borderColor: ColorPalate.secondary,
                  focusNode: reNewPasswordFocus,
                  controller: reNewPasswordController,
                  textInputAction: TextInputAction.done,
                  validator: ValidationBuilder()
                      .required()
                      .minLength(6)
                      .maxLength(50)
                      .add((value) {
                    if (reNewPasswordController.text !=
                        newPasswordController.text) {
                      return "context.local.passwordNotMatched";
                    }
                    return null;
                  }).build(),
                ),
                gap24,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
