import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/reset%20password/reset_password_screen.dart';
import 'package:auth_app/views/auth/reset%20password/view_model/reset_password_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/views/auth/components/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _vm =
    ChangeNotifierProvider.autoDispose((ref) => ResetPasswordViewModel());

class ResetPasswordView extends ConsumerWidget {
  ResetPasswordView({Key? key}) : super(key: key);
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
                      "Reset Password",
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
                    height: 24,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controller,
                    hintText: "Enter your email address",
                    icon: Icons.email,
                    title: "Email",
                    validator: (v) => null,
                  ),
                  const Spacer(),
                  AppButton(
                    title: "Reset Password",
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      model.validate();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPasswordScreen()));
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
