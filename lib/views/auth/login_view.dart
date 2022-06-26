import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/widgets/auth_textfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
   LoginView({Key? key}) : super(key: key);
final TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context,) {
    return Scaffold(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
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
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    // removed center
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 13,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                InkWell(
                                  // onTap: model.toRegister,
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 17, horizontal: 16),
                                      height: 53,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: const Color(0xffe8e8e8),
                                        ),
                                      ),
                                      child: AppText.heading6M(
                                          "I’m new, Register")),
                                ),
                              ]),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                      Center(
                        child: AppText.heading4M(
                          "Login",
                          color: Colors.black,
                          centered: true,
                        ),
                      ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
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
                        controller: controller,
                        hintText: "Enter your email address",
                        icon: Icons.email,
                        title: "Email",
                        validator: (v) => null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AuthTextField(
                        keyboardType: TextInputType.emailAddress,
                        isPassword: true,
                        controller: controller,
                        hintText: "Enter your password",
                        icon: Icons.password,
                        title: "Password",
                        validator: (v) => null,
                        // (v) => Validators.string("password", v),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: InkWell(
                          // onTap: model.navToReset,
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
                      const SizedBox(
                        height: 36,
                      ),
                      AppButton(
                        title: "Login",
                        onTap: () {
                          // FocusScope.of(context).unfocus();
                          // model.validate();
                          // model.onLogin();
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
