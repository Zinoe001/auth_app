import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/login/login_view.dart';
import 'package:auth_app/views/auth/verification/verification_view.dart';
import 'package:auth_app/views/auth/signup/view_model/signup_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/views/auth/components/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _vm = ChangeNotifierProvider.autoDispose((ref) => SignUpViewModel());

class SignUpView extends ConsumerWidget {
  SignUpView({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.watch(_vm);
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
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
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

                  // const BuildAppBar(title: ""),
                  const SizedBox(height: 24),
                  Center(
                    child: AppText.heading4M(
                      "Register",
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: AppText.textFieldR(
                      "Register to start your ZeeFlights application process, and become one of the amazing contestants.",
                      color: const Color(0xff828282),
                      height: 1.5,
                      centered: true,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.text,
                    isPassword: false,
                    controller: controller,
                    hintText: "Enter your full name",
                    icon: Icons.person,
                    title: "Full Name",
                    validator: (v) => null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controller,
                      hintText: "Enter your email address",
                      icon: Icons.email,
                      title: "Email",
                      validator: (v) => null),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                      keyboardType: TextInputType.visiblePassword,
                      // onValueChnaged: model.onPasswordChanged,
                      isPassword: true,
                      controller: controller,
                      hintText: "Create a very strong password",
                      icon: Icons.password,
                      title: "Password",
                      validator: (v) => null),
                  Row(
                    children: [
                      // Checkbox(
                      //   materialTapTargetSize:
                      //       MaterialTapTargetSize.shrinkWrap,
                      //   visualDensity: const VisualDensity(horizontal: -4),
                      //   shape: const RoundedRectangleBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(4))),
                      //   value: model.isChecked,
                      //   onChanged: (v) => model.acceptTerms(v!),
                      // ),
                      const SizedBox(width: 10),
                      InkWell(
                          onTap: () {
                            // model.acceptTerms(!model.isChecked);
                          },
                          child: AppText.captionR(
                              "I accept the terms & conditions"))
                    ],
                  ),
                  const Spacer(),
                  AppButton(
                      title: "Register",
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        model.validate();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VerificationView()));
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView())),
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
                          TextSpan(text: "Already have an account,", children: [
                            TextSpan(
                              text: "  Login",
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
