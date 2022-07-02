import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/view_model/auth_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/views/auth/components/auth_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _viewModelProvider =
    ChangeNotifierProvider.autoDispose((ref) => AuthViewModel());

class CreateAccountView extends ConsumerWidget {
  const CreateAccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.watch(_viewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: model.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 55),
                  Center(
                    child: AppText.heading4M(
                      "Create Account",
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: AppText.textFieldR(
                      "Create account to continue your ZeeFlights application process,",
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
                    controller: model.controller,
                    hintText: "Enter your first name",
                    icon: Icons.person,
                    title: "First Name",
                    validator: (v) => null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.text,
                    isPassword: false,
                    controller: model.controller,
                    hintText: "Enter your last name",
                    icon: Icons.person,
                    title: "Last Name",
                    validator: (v) => null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: model.controller,
                      hintText: "Enter your phone number",
                      icon: Icons.email,
                      title: "Phone Number",
                      validator: (v) => null),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                      keyboardType: TextInputType.visiblePassword,
                      // onValueChnaged: model.onPasswordChanged,
                      isPassword: true,
                      controller: model.controller,
                      hintText: "Create a very strong password",
                      icon: Icons.password,
                      title: "Password",
                      validator: (v) => null),
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       materialTapTargetSize:
                  //           MaterialTapTargetSize.shrinkWrap,
                  //       visualDensity: const VisualDensity(horizontal: -4),
                  //       shape: const RoundedRectangleBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(4))),
                  //       value: model.isChecked,
                  //       onChanged: (v) => model.acceptTerms(v!),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     InkWell(
                  //         onTap: () {
                  //           // model.acceptTerms(!model.isChecked);
                  //         },
                  //         child: AppText.captionR(
                  //             "I accept the terms & conditions"))
                  //   ],
                  // ),
                  const Spacer(),
                  AppButton(
                      title: "Create Account",
                      onTap: () {
                        // model.validate();
                        model.navToLogin();
                      }),
                  const SizedBox(height: 45),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
