import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/core/utils/validators.dart';
import 'package:auth_app/views/auth/view_model/auth_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/views/auth/components/auth_textfield.dart';
import 'package:auth_app/widgets/loader_page.dart';
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
        child: LoadingPage(
          isBusy: model.isBusy,
          child: Form(
            key: model.formKey,
            child: GestureDetector(
              onTap: FocusScope.of(context).unfocus,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      controller: model.passwordController,
                      hintText: "Enter your email address",
                      icon: Icons.email,
                      title: "Email",
                      validator: (v) => Validators.email(v),
                    ),
                    const Spacer(),
                    AppButton(
                      title: "Forgot  Password",
                      onTap: model.forgotPassword,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
