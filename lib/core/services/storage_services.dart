import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static const _storage = FlutterSecureStorage();
/////////// saving email /////////////
  static const _emailKey = "email";

  static Future saveEmail(String email) async =>
      await _storage.write(key: _emailKey, value: email);

  static Future getEmail() async => await _storage.read(key: _emailKey);

/////////// saving otp /////////////
  static const _otpKey = "otp";

  static Future saveOtp(String email) async =>
      await _storage.write(key: _otpKey, value: email);

  static Future getOtp() async => await _storage.read(key: _otpKey);
}
