import 'package:auth_app/core/navigation/routes_name.dart';
import 'package:auth_app/views/auth/create_account_view.dart';
import 'package:auth_app/views/auth/login_view.dart';
import 'package:auth_app/views/auth/reset_password_view.dart';
import 'package:auth_app/views/auth/forgot_password_view.dart';
import 'package:auth_app/views/auth/signup_view.dart';
import 'package:auth_app/views/auth/verification_view.dart';
import 'package:auth_app/views/body/body.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static PageRoute _getPageRoute({
    // ignore: unused_element
    RouteSettings? settings,
    required Widget viewToShow,
    // ignore: unused_element
    Object? arguments,
  }) {
    return MaterialPageRoute(builder: (context) => viewToShow);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginViewRoute:
        return _getPageRoute(viewToShow: const LoginView());
      case SignUpViewRoute:
        return _getPageRoute(viewToShow: const SignUpView());
      case VerificationViewRoute:
        return _getPageRoute(viewToShow: const VerificationView());
      case CreateAccountViewRoute:
        return _getPageRoute(viewToShow: const CreateAccountView());
      case ForgotPasswordViewRoute:
        return _getPageRoute(viewToShow: const ForgotPasswordView());
      case ResetPasswordViewRoute:
        return _getPageRoute(viewToShow: const ResetPasswordView());
      case HomeViewRoute:
        return _getPageRoute(viewToShow: const Body());
      default:
        return _getPageRoute(viewToShow: const Scaffold());
    }
  }
}
