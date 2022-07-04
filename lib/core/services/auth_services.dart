import 'dart:developer';
import 'package:auth_app/core/constants/api_routes.dart';
import 'package:auth_app/core/services/network_services.dart';
import 'package:auth_app/core/services/storage_services.dart';
import 'package:auth_app/models/user_model.dart';
import 'package:auth_app/widgets/auth_flushbar.dart';

class AuthService {
  NetWorkServices services = NetWorkServices();
  AuthFlushbar flushbar = AuthFlushbar();
  UserModel? _currentUser;
  UserModel? get currentUser => _currentUser;
  late String _userEmail;
  late String _otp;

  Future<String> _getSavedEmail() async {
    final saveEmail = await Storage.getEmail();
    _userEmail = saveEmail;
    return _userEmail;
  }

  Future<String> _getSavedOtp() async {
    final saveOtp = await Storage.getOtp();
    _otp = saveOtp;
    return _otp;
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await services
          .post(ApiRoute.login, body: {"email": email, "password": password});
      _currentUser = UserModel.fromJson(response['user']);
      // _saveUserLocally(_currentUser);
      return true;
    } catch (e) {
      flushbar.showError(title: "Error Encountered", message: e.toString());
      return false;
    }
  }

  Future<bool> signUp({
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    try {
      await _getSavedEmail();
      await _getSavedOtp();
      var response = await services.post(ApiRoute.signUp, body: {
        "email": _userEmail,
        "password": password,
        "phone": phone,
        "first_name": firstName,
        "last_name": lastName,
        "pin": _otp,
      });
      flushbar.showSuccessful(
          title: "Account Created Successfully",
          message: "You have successfully created an account with ZeeFlight,"
              "proceed to login to njoy a facinating world of experience");
      UserModel _user = UserModel.fromJson(response);
      // _saveUserLocally(_user);
      _currentUser = _user;
      return true;
    } catch (e) {
      flushbar.showError(title: "Error Encountered", message: e.toString());
      return false;
    }
  }

  Future<bool> emailVerification({
    required String email,
  }) async {
    try {
      Storage.saveEmail(email);
      var response = await services.post(ApiRoute.emailVerification, body: {
        "email": email,
      });
      log(response.toString());
      return true;
    } catch (e) {
      flushbar.showError(title: "Error Encountered", message: e.toString());
      return false;
    }
  }

  Future<bool> otpVerification({
    required String pin,
  }) async {
    try {
      Storage.saveOtp(pin);
      await _getSavedEmail();
      var response = await services.post(ApiRoute.otpVerification, body: {
        "email": _userEmail,
        "pin": pin,
      });
      log(response.toString());
      return true;
    } catch (e) {
      flushbar.showError(title: "Error Encountered", message: e.toString());
      return false;
    }
  }

  Future<bool> forgotPassword({
    required String email,
  }) async {
    _userEmail = email;
    try {
      var response = await services.post(ApiRoute.forgotPassword, body: {
        "email": email,
      });
      log(response.toString());
      return true;
    } catch (e) {
      flushbar.showError(title: "Error Encountered", message: e.toString());
      return false;
    }
  }

  Future<bool> resetPassword({
    required String password,
  }) async {
    try {
      var response = await services.post(ApiRoute.resetPassword, body: {
        "email": _userEmail,
        "password": password,
      });
      log(response.toString());
      return true;
    } catch (e) {
      flushbar.showError(title: "Error Encountered", message: e.toString());
      return false;
    }
  }
}
