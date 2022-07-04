import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/core/utils/validators.dart';
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
        child: Form(
          key: model.formKey,
          child: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  controller: model.passwordController,
                  hintText: "Enter your new password",
                  icon: Icons.email,
                  title: "New Password",
                  validator: (v) => Validators.password(v),
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthTextField(
                  keyboardType: TextInputType.emailAddress,
                  isPassword: true,
                  controller: model.passwordController,
                  hintText: "Confirm password above",
                  icon: Icons.password,
                  title: "Confirm Password",
                  validator: (v) => Validators.password(v),
                  // (v) => Validators.string("password", v),
                ),
                const Spacer(),
                AppButton(
                    title: "Reset Password", onTap: () => model.resetPassword),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
