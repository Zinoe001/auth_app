import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/view_model/auth_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/views/auth/components/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _viewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => AuthViewModel());

class ResetPasswordView extends ConsumerWidget {
 const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.watch(_viewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: model.formKey,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Center(
                    child: AppText.heading4M(
                      "Reset Password",
                      color: Colors.black,
                      centered: true,
                    ),
                  ),
                  Center(
                    child: AppText.textFieldR(
                      "🤗Thanks for your compliance",
                      height: 1.5,
                      color: const Color(0xff828282),
                      centered: true,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: model.controller,
                    hintText: "Enter your new password",
                    icon: Icons.email,
                    title: "New Password",
                    validator: (v) => null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.emailAddress,
                    isPassword: true,
                    controller: model.controller,
                    hintText: "Confirm password above",
                    icon: Icons.password,
                    title: "Confirm Password",
                    validator: (v) => null,
                    // (v) => Validators.string("password", v),
                  ),
                  const Spacer(),
                  AppButton(
                    title: "Reset Password",
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      // model.validate();
                      model.navToLogin();
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
