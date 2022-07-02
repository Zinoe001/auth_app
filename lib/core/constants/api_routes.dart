

class ApiRoute {
  /// this is the server url
// const String BaseUrl = "https://ravenlivestream-api.com/";
 static const String baseUrl = "https://kudel-exp-api.herokuapp.com";

  // base url
  /// this is used as a place holder incase
  /// base url needs to be added while creating routes
  // static const String _BaseUrl = "";

  // static const String _BaseUrl = "http://192.168.43.153:8080";

  ///? === route that ends with "/" need an id or something to append to it

  ////====================================
  //===========AUTHENTICATION=================//
  ////====================================

  static const String login = "/api/auth/token/login/";
  static const String signUp = "/api/auth/users/?as=REGULAR";
  static const String emailVerification = "/api/auth/send/verification/email/";
  static const String otpVerification = "/api/auth/verify/email/";
  static const String forgotPassword = "/api/auth/recover/password/trigger/";
  static const String resetPassword = "/api/auth/recover/password/reset/";

}
