import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/utils.dart';
import '../presentation/widgets/widgets.dart';

final scaffoldKeyProvider = Provider<GlobalKey<ScaffoldMessengerState>>((ref) {
  final snackbarKey = GlobalKey<ScaffoldMessengerState>();
  return snackbarKey;
});

final snackBarProvider = Provider.family<
    ScaffoldFeatureController<SnackBar, SnackBarClosedReason>,
    String>((ref, String text) {
  final snackbar = ref.watch(scaffoldKeyProvider).currentState!.showSnackBar(
        SnackBar(content: Text(text)),
      );
  return snackbar;
});

final appLocalProvider = StateProvider<Locale>((ref) {
  return const Locale('en', 'US');
});

final digitLocalizationProvider =
    StateProvider.family<String, num>((ref, num digit) {
  var localDigit = '';

  final lg = ref.watch(appLocalProvider);
  // const supportLocal = AppLocalizations.supportedLocales;

  // localDigit = digit.toArabicDigits();

  switch (lg.languageCode) {
    case 'ar':
      localDigit = digit.toArabicDigits();
      break;

    default:
      localDigit = digit.toString();
  }

  return localDigit;
});

CancelFunc showNotification({
  required String title,
  String? theme,
}) {
  final isDark = theme != null ? theme == 'dark' : false;
  return BotToast.showSimpleNotification(
    title: title,
    align: const Alignment(0, 0.99),
    duration: const Duration(milliseconds: 4000),
    // animationDuration: kThemeAnimationDuration,
    dismissDirections: [DismissDirection.horizontal, DismissDirection.up],
    hideCloseButton: true,
    titleStyle: isDark
        ? TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          )
        : TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
    backgroundColor: isDark ? const Color(0xff8a938b) : const Color(0xff717971),
  );
}

final notification = Provider.family<Function(), String>((ref, String text) {
  final mode = ref.watch(themeProvider).theme;
  final notification = showNotification(theme: mode, title: text);
  return notification;
});

CancelFunc showLoading() => BotToast.showLoading();
void closeLoading() => BotToast.closeAllLoading();

CancelFunc showToast(String text) => BotToast.showText(
      text: text,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
      duration: const Duration(seconds: 3),
      contentPadding: const EdgeInsets.all(10),
      contentColor: const Color(0xFF3D3D3D),
      borderRadius: radius12,
      wrapToastAnimation: (controller, cancel, Widget child) =>
          CustomAnimationWidget(
        controller: controller,
        child: child,
      ),
    );
CancelFunc showErrorToast(String text) => BotToast.showText(
      text: text,
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
      duration: const Duration(seconds: 3),
      contentPadding: const EdgeInsets.all(10),
      contentColor: ColorPalate.error,
      borderRadius: radius12,
      wrapToastAnimation: (controller, cancel, Widget child) =>
          CustomAnimationWidget(
        controller: controller,
        child: child,
      ),
    );

CancelFunc showAttachedWidget({
  required Widget Function(void Function()) builder,
}) =>
    BotToast.showAnimationWidget(
      toastBuilder: builder,
      clickClose: true,
      allowClick: true,
      onlyOne: false,
      crossPage: false,
      backButtonBehavior: BackButtonBehavior.ignore,
      wrapToastAnimation: (controller, cancel, Widget child) => Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              cancel();
            },
            child: AnimatedBuilder(
              builder: (_, child) => Opacity(
                opacity: controller.value,
                child: child,
              ),
              animation: controller,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.black26),
                child: SizedBox.expand(),
              ),
            ),
          ),
          CustomOffsetAnimation(controller: controller, child: child)
        ],
      ),
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 2),
    );

Future showFloatBottomSheet(
  BuildContext context, {
  required Widget Function(BuildContext context) builder,
}) =>
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      elevation: 0,
      builder: (context) => Container(
        // height: height,
        margin: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: IntrinsicHeight(
          child: builder(context),
        ),
      ),
    );

bool? showBotToastDialog({
  required bool? Function() cancel,
  required bool? Function() confirm,
  Widget? title,
  Widget? content,
  Widget? confirmWidget,
  Widget? cancelWidget,
  String? cancelText,
  String? confirmText,
}) {
  BotToast.showAnimationWidget(
    clickClose: false,
    allowClick: false,
    onlyOne: true,
    crossPage: true,
    backButtonBehavior: BackButtonBehavior.ignore,
    wrapToastAnimation: (controller, cancel, child) => Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          //The DecoratedBox here is very important,he will fill the entire parent component
          child: AnimatedBuilder(
            builder: (_, child) => Opacity(
              opacity: controller.value,
              child: child,
            ),
            animation: controller,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.black26),
              child: SizedBox.expand(),
            ),
          ),
        ),
        CustomOffsetAnimation(controller: controller, child: child)
      ],
    ),
    toastBuilder: (cancelFunc) => AlertDialog(
      title: title ?? const Text('this is custom widget'),
      content: content,
      actions: <Widget>[
        SizedBox(
          height: 42.h,
          width: .32.sw,
          child: cancelWidget ??
              KOutlinedButton(
                foregroundColor: ColorPalate.primary,
                borderColor: ColorPalate.primary,
                onPressed: () {
                  cancelFunc();
                  cancel();
                },
                text: cancelText ?? 'Cancel',
              ),
        ),
        SizedBox(
          width: .3.sw,
          child: SizedBox(
            height: 42.h,
            width: .32.sw,
            child: confirmWidget ??
                KElevatedButton(
                  isSecondary: true,
                  onPressed: () {
                    confirm();
                    cancelFunc();
                  },
                  text: confirmText ?? 'Confirm',
                ),
          ),
        ),
      ],
    ),
    animationDuration: const Duration(milliseconds: 300),
  );
  return null;
}

bool? showSimpleDialog({
  required Widget Function(void Function()) builder,
}) {
  BotToast.showAnimationWidget(
    clickClose: true,
    allowClick: true,
    onlyOne: true,
    crossPage: true,
    backButtonBehavior: BackButtonBehavior.close,
    wrapToastAnimation: (controller, cancel, child) => Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            cancel();
          },
          //The DecoratedBox here is very important,he will fill the entire parent component
          child: AnimatedBuilder(
            builder: (_, child) => Opacity(
              opacity: controller.value,
              child: child,
            ),
            animation: controller,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.black26),
              child: SizedBox.expand(),
            ),
          ),
        ),
        CustomOffsetAnimation(controller: controller, child: child)
      ],
    ),
    toastBuilder: builder,
    animationDuration: const Duration(milliseconds: 300),
  );
  return null;
}

class CustomOffsetAnimation extends HookConsumerWidget {
  final AnimationController controller;
  final Widget child;

  const CustomOffsetAnimation(
      {Key? key, required this.controller, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final tweenOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.8),
      end: Offset.zero,
    );
    final tweenScale = Tween<double>(begin: 0.3, end: 1.0);
    final animation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return FractionalTranslation(
          translation: tweenOffset.evaluate(animation),
          child: ClipRect(
            child: Transform.scale(
              scale: tweenScale.evaluate(animation),
              child: Opacity(
                opacity: animation.value,
                child: child,
              ),
            ),
          ),
        );
      },
      child: child,
    );
  }
}

class CustomAnimationWidget extends HookConsumerWidget {
  final AnimationController controller;
  final Widget child;

  const CustomAnimationWidget({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final tweenOffset = Tween<Offset>(
      begin: const Offset(0, 40),
      end: const Offset(0, 0),
    );

    final tweenScale = Tween<double>(begin: 0.7, end: 1.0);
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: tweenOffset.evaluate(animation),
          child: Transform.scale(
            scale: tweenScale.evaluate(animation),
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}

class CustomAttachedAnimation extends HookConsumerWidget {
  final AnimationController controller;
  final Widget child;

  const CustomAttachedAnimation({
    Key? key,
    required this.controller,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            heightFactor: animation.value,
            widthFactor: animation.value,
            child: Opacity(
              opacity: animation.value,
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
