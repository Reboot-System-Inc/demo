import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../application/auth/loggedin_provider.dart';
import '../../utils/utils.dart';
import '../../application/auth/auth_provider.dart';
import '../../application/global.dart';
// import '../../application/home/home_provider.dart';
import '../auth/login/login.dart';
import '../widgets/widgets.dart';
import 'pages/change_password_screen.dart';
import 'pages/edit_profile/edit_profile_screen.dart';
import 'widgets/picture_widget.dart';

class ProfileScreen extends HookConsumerWidget {
  static String route = "/profile";
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(authProvider);
    // final homeState = ref.watch(homeProvider);
    final localState = ref.watch(appLocalProvider);
    // final isLoggedIn = ref.watch(loggedInProvider).loggedIn;

    return Scaffold(
      backgroundColor: ColorPalate.white,
      appBar: KAppBar(titleText: context.local.profile),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //? Top Section
            gap18,
            ProfilePicWidget(
              onEditTap: () => context.push(EditProfileScreen.route),
            ),
            gap40,
            Container(
              padding: padding20,
              decoration: BoxDecoration(
                color: ColorPalate.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  // KDivider(height: 36.h),
                  // _optionList(
                  //   leading: Icons.favorite_border_rounded,
                  //   title: context.local.yourFavorites,
                  //   onTap: () => context.push(FavoritesScreen.route),
                  // ),
                  KDivider(height: 36.h),
                  _optionList(
                    leading: Icons.remove_red_eye_outlined,
                    title: context.local.password,
                    onTap: () => context.push(ChangePasswordScreen.route),
                  ),
                  KDivider(height: 36.h),
                  _optionList(
                    leading: FontAwesomeIcons.globe,
                    title: context.local.language,
                    trailingText: localState.languageCode == 'en'
                        ? context.local.english
                        : context.local.arabic,
                    onTap: () {
                      // ref.read(appLocalProvider.notifier).update(
                      //   (state) => localState.languageCode == 'en'
                      //       ? const Locale("ar", "AR")
                      //       : const Locale("en", "US"));
                    },
                  ),
                  KDivider(height: 36.h),
                  _optionList(
                    leading: Icons.login_outlined,
                    title: context.local.logout,
                    onTap: () => showFloatBottomSheet(context, builder: (_) {
                      return LogoutDialog(
                        onYesPressed: () {
                          ref.read(authProvider.notifier).logout();
                          context.go(LoginScreen.route);
                        },
                        onNoPressed: () {},
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionList({
    required IconData leading,
    required String title,
    String? trailingText,
    bool visible = true,
    VoidCallback? onTap,
  }) {
    return Visibility(
      visible: visible,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius10,
        child: Row(
          children: [
            Icon(
              leading,
              size: 20.sp,
              color: ColorPalate.secondary,
            ),
            gap16,
            Expanded(
              child: Text(
                title,
                style: CustomTextStyle.textStyle14w400,
              ),
            ),
            trailingText == null
                ? const SizedBox.shrink()
                : Text(
                    trailingText,
                    style: CustomTextStyle.textStyle14w500Red,
                  ),
            gap12,
            Icon(
              Icons.chevron_right_rounded,
              size: 28.sp,
              color: ColorPalate.black,
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutDialog extends HookConsumerWidget {
  const LogoutDialog(
      {super.key, required this.onYesPressed, required this.onNoPressed});

  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Text(
          'LOGOUT',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Are you sure you want to logout?",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: .3.sw,
                child: KElevatedButton(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.pop(context);
                    onNoPressed.call();
                  },
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(.4),
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              SizedBox(
                width: .3.sw,
                child: FilledButton(
                  child: Text("Yes"),
                  onPressed: () {
                    Navigator.pop(context);
                    onYesPressed.call();
                    // context.go(LoginScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }
}
