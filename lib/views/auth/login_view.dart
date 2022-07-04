import 'package:auth_app/core/utils/colors.dart';
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

class LoginView extends ConsumerWidget {
  const LoginView({Key? key}) : super(key: key);
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
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: model.navBack,
                        child: Container(
                          height: 36,
                          width: 36,
                          // padding: const EdgeInsets.fromLTRB(7, 10, 15, 10),

                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Colors.grey.shade200,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          // removed center
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 13,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: AppText.heading4M(
                      "Login",
                      color: Colors.black,
                      centered: true,
                    ),
                  ),
                  AppText.textFieldR(
                    "🤗Welcome back, to login back to the app, "
                    "kindly provide the required information for the fields",
                    height: 1.5,
                    color: const Color(0xff828282),
                    centered: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: model.emailController,
                    hintText: "Enter your email address",
                    icon: Icons.email,
                    title: "Email",
                    validator: (v) => Validators.email(v),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    controller: model.passwordController,
                    hintText: "Enter your password",
                    icon: Icons.password,
                    title: "Password",
                    validator: (v) => Validators.password(v),
                    // (v) => Validators.string("password", v),
                  ),
                  const SizedBox(height: 200),
                  AppButton(
                    title: "Login",
                    onTap: model.toHome,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: InkWell(
                      onTap: model.navToForgotPassword,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 13, horizontal: 16),
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: const Color(0xfff7f7f7),
                          ),
                        ),
                        child: Text.rich(
                          TextSpan(
                              text: "Can’t remember password🤔?",
                              children: [
                                TextSpan(
                                  text: " Reset",
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ]),
                        ),
                      ),
                    ),
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
