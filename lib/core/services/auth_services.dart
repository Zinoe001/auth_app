import 'dart:developer';
import 'package:auth_app/core/constants/api_routes.dart';
import 'package:auth_app/core/services/network_services.dart';
import 'package:auth_app/models/user_model.dart';

class AuthService {
  NetWorkServices services = NetWorkServices();
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  String? _userEmail;
  String? _otp;

  String get userEmail => _userEmail ?? "";

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await services
          .post(ApiRoute.login, body: {"email": email, "password": password});
      _currentUser = UserModel.fromJson(response['data']);
      // _saveUserLocally(_currentUser);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp({
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    try {
      var response = await services.post(ApiRoute.signUp, body: {
        "email": _userEmail,
        "password": password,
        "phone": phone,
        "pin": _otp,
        "first_name": firstName,
        "last_name": lastName,
      });
      _currentUser = UserModel.fromJson(response['data']);
      // _saveUserLocally(_currentUser);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> emailVerification({
    required String email,
  }) async {
    _userEmail = email;
    try {
      var response = await services.post(ApiRoute.emailVerification, body: {
        "email": email,
      });
      log(response.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> otpVerification({
    required String pin,
  }) async {
    _otp = pin;
    try {
      var response = await services.post(ApiRoute.emailVerification, body: {
        "email": _userEmail,
        "pin": pin,
      });
      log(response.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    _userEmail = email;
    try {
      var response = await services.post(ApiRoute.forgotPassword, body: {
        "email": email,
      });
      log(response.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> resetPassword({
    required String password,
  }) async {
    try {
      var response = await services.post(ApiRoute.resetPassword, body: {
        "email": _userEmail,
        "password": password,
      });
      log(response.toString());
    } catch (e) {
      rethrow;
    }
  }
}
