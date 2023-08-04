import '../../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../application/auth/auth_provider.dart';

import '../../../application/global.dart';
import '../../widgets/widgets.dart';

class ProfilePicWidget extends HookConsumerWidget {
  const ProfilePicWidget({
    Key? key,
    required this.onEditTap,
  }) : super(key: key);

  final Function() onEditTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    String getName() {
      return ref.watch(appLocalProvider).languageCode == 'en'
          ? "${state.user.firstName} ${state.user.lastName}"
          : state.user.nameInArabic.isEmpty
              ? "_ _"
              : state.user.nameInArabic;
    }

    return KInkWell(
      onTap: onEditTap,
      borderRadius: radius16,
      child: Container(
        padding: padding20,
        decoration: BoxDecoration(
          color: ColorPalate.white,
          borderRadius: radius16,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 81.w,
              width: 81.w,
              child: state.user.profilePicture.isNotEmpty
                  ? KCircleAvatar(
                      imgUrl: state.user.profilePicture,
                      radius: 40.w,
                      enableBorder: true,
                    )
                  : CircleAvatar(
                      radius: 40.w,
                      backgroundColor: context.color.onPrimaryContainer,
                      child: const Icon(
                        Icons.person_outline,
                        size: 80,
                      ),
                    ),
              // child: Image.asset(KAssets.avatar),
            ),
            gap16,
            Column(
              crossAxisAlignment: crossStart,
              children: [
                Text(
                  getName(),
                  style: CustomTextStyle.textStyle16w600,
                ),
                gap4,
                Text(
                  state.user.email,
                  style: CustomTextStyle.textStyle14w400HG800,
                ),
                gap4,
                Text(
                  ref.watch(appLocalProvider).languageCode == 'en'
                      ? state.user.phone
                      : int.parse(state.user.phone).toArabicDigits(),
                  style: CustomTextStyle.textStyle14w400HG800,
                ),
              ],
            ),
            const Spacer(),
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
