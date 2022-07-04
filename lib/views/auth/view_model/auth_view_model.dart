import 'package:auth_app/core/navigation/navigation_service.dart';
import 'package:auth_app/core/navigation/routes_name.dart';
import 'package:auth_app/core/services/auth_services.dart';
import 'package:auth_app/models/base_view_model.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends BaseViewModel {
  AuthService service = AuthService();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  Future<void> forgotPassword() async {
    // check if all inputs are correct
    // if no stop function
    if (formKey.currentState!.validate()) {
      // set state to busy
      changeState(ViewState.busy);
      // calling server to send verification mail
      bool result = await service.forgotPassword(email: emailController.text);
      // go to verification view if communication with server was suceful
      if (result) {
        //to verification
        NavigationService.instance.navigateTo(ResetPasswordViewRoute);
      }
      // chage state from busy to idle
      changeState(ViewState.idle);
    }
  }

  Future<void> resetPassword() async {
    // check if all inputs are correct
    // if no stop function
    if (formKey.currentState!.validate()) {
      // set state to busy
      changeState(ViewState.busy);
      // calling server to send verification mail
      bool result =
          await service.resetPassword(password: passwordController.text);
      // go to verification view if communication with server was suceful
      if (result) {
        //to verification
        NavigationService.instance.navigateTo(LoginViewRoute);
      }
      // chage state from busy to idle
      changeState(ViewState.idle);
    }
  }

  Future<void> toHome() async {
    // check if all inputs are correct
    // if no stop function
    if (formKey.currentState!.validate()) {
      // set state to busy
      changeState(ViewState.busy);
      // calling server to send verification mail
      bool result = await service.login(
          email: emailController.text, password: passwordController.text);
      // go to verification view if communication with server was successful
      if (result) {
        //to verification
        NavigationService.instance.navigateToReplace(HomeViewRoute);
      }
      // chage state from busy to idle
      changeState(ViewState.idle);
    }
  }

  Future<void> verifyEmail() async {
    // check if all inputs are correct
    // if no stop function
    if (formKey.currentState!.validate()) {
      // set state to busy
      changeState(ViewState.busy);
      // calling server to send verification mail
      bool result =
          await service.emailVerification(email: emailController.text);
      // go to verification view if communication with server was successful
      if (result) {
        //to verification
        NavigationService.instance.navigateTo(VerificationViewRoute);
      }
      // chage state from busy to idle
      changeState(ViewState.idle);
    }
  }

  Future<void> toCreateAccount() async {
    // check if all inputs are correct
    // if no stop function
    if (formKey.currentState!.validate()) {
      // set state to busy
      changeState(ViewState.busy);
      // calling server to send verification mail
      bool result = await service.otpVerification(pin: pinController.text);
      // go to verification view if communication with server was suceful
      if (result) {
        //to verification
        NavigationService.instance.navigateTo(CreateAccountViewRoute);
      }
      // chage state from busy to idle
      changeState(ViewState.idle);
    }
  }

  Future<void> createUser() async {
    // check if all inputs are correct
    // if no stop function
    if (formKey.currentState!.validate()) {
      // set state to busy
      changeState(ViewState.busy);
      // calling server to send verification mail
      bool result = await service.signUp(
          password: passwordController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phone: phoneController.text);
      // go to verification view if communication with server was suceful
      if (result) {
        //to verification
        NavigationService.instance.navigateTo(LoginViewRoute);
      }
      // chage state from busy to idle
      changeState(ViewState.idle);
    }
  }

  navToLogin() {
    NavigationService.instance.navigateToReplace(LoginViewRoute);
  }

  navToForgotPassword() {
    NavigationService.instance.navigateToReplace(ForgotPasswordViewRoute);
  }

  navBack() {
    NavigationService.instance.navBack();
  }
}
