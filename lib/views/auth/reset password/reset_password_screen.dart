import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/login/login_view.dart';
import 'package:auth_app/views/auth/reset%20password/view_model/reset_password_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/views/auth/components/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _vm =
    ChangeNotifierProvider.autoDispose((ref) => ResetPasswordViewModel());

class ResetPasswordScreen extends ConsumerWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
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
                  const SizedBox(
                    height: 24,
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
                    controller: controller,
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
                    controller: controller,
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
                      model.validate();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
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
