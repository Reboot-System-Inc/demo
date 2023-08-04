import 'dart:convert';
import 'dart:io';

import '../../domain/auth/login_send_otp_response.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import '../../utils/strings.dart';

import '../domain/auth/login_body.dart';
import '../domain/auth/profile_update_body.dart';
import '../domain/auth/signup_response.dart';
import '../domain/auth/signup_body.dart';
import '../domain/simple_response.dart';
import '../utils/api_routes.dart';
import '../utils/network_util/network_handler.dart';

class AuthRepo {
  final api = NetworkHandler.instance;
  // @override
  // Future<Option<UserModel>> getUserData() {}

  Future<Either<CleanFailure, LoginSendOtpResponse>> loginGetOtp(
      LoginBody body) async {
    final data = await api.post(
      fromData: (json) => LoginSendOtpResponse.fromMap(json),
      endPoint: APIRoute.LIGNIN_SEND_OTP,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      Logger.v("data: $data");
      return right(r);
    });
  }

  Future<Either<CleanFailure, AuthResponse>> loginCheckOtp(
      LoginOtpBody body) async {
    final data = await api.post(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.LIGNIN_CHECK_OTP,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']["message"]);
      return left(failure);
    }, (r) {
      Logger.v("data: $data");
      final box = Hive.box(KStrings.cacheBox);
      box.put(KStrings.token, r.user.token);
      api.setToken(r.user.token);
      return right(r);
    });
  }

  Future<Either<CleanFailure, SimpleResponse>> setDeviceToken(
      String dToken) async {
    final data = await api.put(
      fromData: (json) => SimpleResponse.fromMap(json),
      endPoint: APIRoute.DEVICE_TOKEN,
      body: {
        "deviceToken": dToken,
      },
      withToken: true,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) {
      Logger.v("data: $data");
      return right(r);
    });
  }

  Future<Either<CleanFailure, AuthResponse>> signUp(SignupBody body) async {
    final data = await api.post(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.SIGNUP,
      body: body.toMap(),
      withToken: false,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) {
      return right(r);
    });
  }

  Future<Either<CleanFailure, AuthResponse>> profileView() async {
    final data = await api.get(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.PROFILE_VIEW,
      withToken: true,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) {
      return right(r);
    });
  }

  Future<Either<CleanFailure, AuthResponse>> profileUpdate(
      ProfileUpdateBody body) async {
    final data = await api.put(
      fromData: (json) => AuthResponse.fromMap(json),
      endPoint: APIRoute.PROFILE_UPDATE,
      body: body.toMap(),
      withToken: true,
    );

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) {
      return right(r);
    });
  }

  Future<String> imageUpload(File image) async {
    var request = MultipartRequest(
        'POST', Uri.parse(APIRoute.BASE_URL + APIRoute.IMAGE_UPLOAD));

    request.files.add(
      MultipartFile.fromBytes(
        'image',
        File(image.path).readAsBytesSync(),
        filename: image.path,
      ),
    );
    final res = await request.send();
    final response = await Response.fromStream(res);
    Logger.v(res);
    Logger.v(response.body);
    final Map<String, dynamic> data = jsonDecode(response.body);
    Logger.v(data['data']['Location']);
    return data['data']['Location'];
  }
}
