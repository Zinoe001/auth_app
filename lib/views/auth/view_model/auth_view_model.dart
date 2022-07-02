import 'package:auth_app/core/navigation/navigation_service.dart';
import 'package:auth_app/core/navigation/routes_name.dart';
import 'package:auth_app/models/base_view_model.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends BaseViewModel {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  validate() async {}

  navToLogin() {
    NavigationService.instance.navigateToReplace(LoginViewRoute);
  }

  navToSignUp() {
    NavigationService.instance.navigateTo(SignUpViewRoute);
  }

  navToVerification(){
    NavigationService.instance.navigateToReplace(VerificationViewRoute);
  }

  navToCreateAccount(){
    NavigationService.instance.navigateToReplace(CreateAccountViewRoute);
  }

  navToForgotPassword() {
    NavigationService.instance.navigateToReplace(ForgotPasswordViewRoute);
  }

  navToReset(){
    NavigationService.instance.navigateToReplace(ResetPasswordViewRoute);
  }

  navToHome() {
    NavigationService.instance.navigateTo(HomeViewRoute);
  }

  navBack() {
    NavigationService.instance.navBack();
  }
}
