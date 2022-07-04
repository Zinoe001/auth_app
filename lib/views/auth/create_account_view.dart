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

class CreateAccountView extends ConsumerWidget {
  const CreateAccountView({Key? key}) : super(key: key);
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
                    controller: model.firstNameController,
                    hintText: "Enter your first name",
                    icon: Icons.person,
                    title: "First Name",
                    validator: (v) => Validators.firstName(v),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                    keyboardType: TextInputType.text,
                    isPassword: false,
                    controller: model.lastNameController,
                    hintText: "Enter your last name",
                    icon: Icons.person,
                    title: "Last Name",
                    validator: (v) => Validators.lastName(v),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                      keyboardType: TextInputType.number,
                      controller: model.phoneController,
                      hintText: "Enter your phone number",
                      icon: Icons.email,
                      title: "Phone Number",
                      validator: (v) => Validators.phoneNumber(v)),
                  const SizedBox(
                    height: 10,
                  ),
                  AuthTextField(
                      keyboardType: TextInputType.visiblePassword,
                      // onValueChnaged: model.onPasswordChanged,
                      isPassword: true,
                      controller: model.passwordController,
                      hintText: "Create a very strong password",
                      icon: Icons.password,
                      title: "Password",
                      validator: (v) => Validators.password(v)),
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
                  const SizedBox(
                    height: 75,
                  ),
                  AppButton(
                      title: "Create Account", onTap: () => model.createUser()),
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
