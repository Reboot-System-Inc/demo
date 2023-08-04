import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../application/auth/auth_provider.dart';
import '../../../../application/auth/auth_state.dart';
import '../../../../domain/auth/profile_update_body.dart';
import '../../../../application/global.dart';
import '../../../../utils/utils.dart';
import '../../../widgets/widgets.dart';

class EditProfileScreen extends HookConsumerWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static const route = '/edit-profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final imageFile = useState<File?>(null);
    // final avatar = useState('');

    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneController = useTextEditingController();

    // final loading = useState(false);

    useEffect(() {
      // Future.microtask(() => ref.read(profileProvider.notifier).getProfile());
      return null;
    }, []);

    ref.listen<AuthState>(
      authProvider,
      (previous, next) {
        if (previous!.loading == false && next.loading) {
          showLoading();
        } else {
          closeLoading();

          firstNameController.text = next.user.firstName;
          lastNameController.text = next.user.lastName;
          // setDate(next.user.dateOfBirth);
          emailController.text = next.user.email;
          phoneController.text = next.user.phone;
        }
      },
    );

    final firstName = useState(firstNameController.text);
    final lastName = useState(lastNameController.text);
    final email = useState(emailController.text);
    final phone = useState(phoneController.text);

    useEffect(() {
      Future.microtask(() => ref.read(authProvider.notifier).profileView());
      return null;
    }, []);

    return Scaffold(
      appBar: KAppBar(
        titleText: context.local.profile,
        actions: [
          SizedBox(
            width: 80.w,
            child: TextButton(
              onPressed: () {
                ref.read(authProvider.notifier).profileUpdate(
                    ProfileUpdateBody(
                      email: emailController.text.trim(),
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      phone: phoneController.text.trim(),
                      profilePicture: state.user.profilePicture,
                    ),
                    imageFile.value);
              },
              child: Text(
                "context.local.save",
                style: CustomTextStyle.textStyle16w400secondary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: formKey,
          child: Container(
            padding: paddingH16,
            decoration: BoxDecoration(
              color: ColorPalate.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                gap20,
                ImagePickWidget(
                  imageFile: imageFile,
                  image: state.user.profilePicture,
                  defaultWidget: Icon(
                    Icons.person,
                    size: 68.sp,
                    color: ColorPalate.secondary,
                  ),
                  editIcon: true,
                  builder: (imageProvider, child) => CircleAvatar(
                    radius: 48.r,
                    backgroundColor: ColorPalate.secondary.withOpacity(.2),
                    backgroundImage: imageProvider,
                    child: child,
                  ),
                ),
                gap36,
                KTextFormField2(
                  hintText: context.local.firstName,
                  controller: firstNameController,
                  isLabel: true,
                  validator: ValidationBuilder().maxLength(15).build(),
                  onChanged: (value) {
                    firstName.value = value;
                  },
                ),
                gap24,
                KTextFormField2(
                  hintText: context.local.lastName,
                  controller: lastNameController,
                  isLabel: true,
                  validator: ValidationBuilder().maxLength(15).build(),
                  onChanged: (value) {
                    lastName.value = value;
                  },
                ),
                gap24,
                KTextFormField2(
                  hintText: context.local.email,
                  controller: emailController,
                  isLabel: true,
                  validator: ValidationBuilder().maxLength(30).email().build(),
                  onChanged: (value) {
                    email.value = value;
                  },
                ),
                gap24,
                KTextFormField2(
                  hintText: context.local.phoneNumber,
                  controller: phoneController,
                  isLabel: true,
                  readOnly: true,
                  validator: ValidationBuilder()
                      .maxLength(11)
                      .minLength(11)
                      .phone()
                      .build(),
                  onChanged: (value) {
                    phone.value = value;
                  },
                ),
                gap20,
                Row(
                  mainAxisAlignment: mainCenter,
                  children: [
                    Image.asset(
                      "KAssets.rightIcon",
                      fit: BoxFit.fitHeight,
                      height: 32.h,
                    ),
                    Text(
                      "context.local.mobileVerified",
                      style: CustomTextStyle.textStyle14w400,
                    )
                  ],
                ),
                gap28,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
