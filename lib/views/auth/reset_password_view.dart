import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
   ResetPassword({Key? key}) : super(key: key);
final TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context,) {
    return  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                // key: model.formKey,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const BuildAppBar(title: ""),
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
                      const SizedBox(height: 30),
                      AppButton(
                        title: "Reset Password",
                        onTap: () {
                          // FocusScope.of(context).unfocus();
                          // model.validate();
                        },
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
