import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/view_model/auth_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/views/auth/components/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _viewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => AuthViewModel());

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);
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
                  const SizedBox(height: 55),
                  Center(
                    child: AppText.heading4M(
                      "Forgot Password",
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: AppText.textFieldR(
                      "Oh! Have you lost your password? Stay calm while we help you reset it.😎",
                      height: 1.5,
                      color: const Color(0xff828282),
                      centered: true,
                    ),
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: model.controller,
                    hintText: "Enter your email address",
                    icon: Icons.email,
                    title: "Email",
                    validator: (v) => null,
                  ),
                  const Spacer(),
                  AppButton(
                    title: "Forgot  Password",
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      // model.validate();
                      model.navToReset();
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
