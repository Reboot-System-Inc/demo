import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/login_body.dart';
import '../../domain/auth/model/user_model.dart';
import '../../domain/auth/profile_update_body.dart';
import '../../domain/auth/signup_body.dart';
import '../../infrastructure/auth_repository.dart';
import '../../route/go_router.dart';
import '../../utils/utils.dart';
import '../global.dart';
import '../local_storage/storage_handler.dart';
import 'auth_state.dart';
import 'loggedin_provider.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(AuthRepo(), ref);
}, name: 'authProvider');

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepo repo;
  final Ref ref;

  AuthNotifier(this.repo, this.ref) : super(AuthState.init());

  void setUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  void setLanguage(String l) {
    state = state.copyWith(language: l);
  }

  Future<bool> signUp(SignupBody body) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final res = await repo.signUp(body);

    showNotification(
      title: res.match((l) {
        return l.error;
      }, (r) => r.message),
    );

    state = res.fold(
      (l) {
        // CleanFailureDialogue.show(context, failure: l);
        // showSnackBar(context, l.error);
        return state.copyWith(failure: l, loading: false);
      },
      (r) {
        success = r.success;
        return state.copyWith(user: r.user, loading: false);
      },
    );
    return success;
  }

  Future<bool> loginGetOtp(LoginBody body) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final result = await repo.loginGetOtp(body);

    state = result.fold(
      (l) {
        showToast(l.error);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        success = r.success;
        showToast(r.message);
        return state.copyWith(loading: false);
      },
    );
    return success;
  }

  Future<bool> loginCheckOtp(LoginOtpBody body) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final result = await repo.loginCheckOtp(body);

    state = result.fold(
      (l) {
        BotToast.showText(text: l.error, contentColor: ColorPalate.error);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        showToast(r.message);
        ref
            .read(loggedInProvider.notifier)
            .updateAuthCache(token: r.user.token, user: r.user);
        // ref.read(loggedInProvider.notifier).isLoggedIn();
        success = r.success;

        final String deviceToken = ref
            .read(hiveProvider)
            .get(KStrings.firebaseToken, defaultValue: '') as String;

        Logger.d("deviceToken: $deviceToken");

        if (deviceToken.isNotEmpty) repo.setDeviceToken(deviceToken);

        return state.copyWith(user: r.user, loading: false);
      },
    );
    return success;
  }

  void logout() {
    state = state.copyWith(user: UserModel.init());

    ref.read(loggedInProvider.notifier).deleteAuthCache();

    // _ref.read(loggedInProvider.notifier).isLoggedIn();

    showToast('${state.user.name} logging out');
  }

  void profileView() async {
    state = state.copyWith(loading: true);
    final result = await repo.profileView();

    state = result.fold(
      (l) {
        BotToast.showText(text: l.error, contentColor: ColorPalate.error);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        return state.copyWith(user: r.user, loading: false);
      },
    );
  }

  void profileUpdate(ProfileUpdateBody user, File? image) async {
    state = state.copyWith(loading: true);
    String? imageUrl;
    if (image != null) {
      imageUrl = await uploadImage(image);
    }
    user = user.copyWith(profilePicture: imageUrl ?? user.profilePicture);
    Logger.v('user: $user');
    final result = await repo.profileUpdate(user);

    state = result.fold(
      (l) {
        BotToast.showText(text: l.error, contentColor: ColorPalate.error);
        return state = state.copyWith(failure: l, loading: false);
      },
      (r) {
        ref.read(routerProvider).pop();
        return state.copyWith(user: r.user, loading: false);
      },
    );
  }

  Future<String> uploadImage(File file) {
    return repo.imageUpload(file);
  }
}
