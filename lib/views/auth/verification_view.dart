import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/view_model/auth_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:auth_app/widgets/loader_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

final _viewModelProvider =
    ChangeNotifierProvider.autoDispose<AuthViewModel>((ref) => AuthViewModel());

class VerificationView extends ConsumerWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.watch(_viewModelProvider);
    return Scaffold(
      body: LoadingPage(
        isBusy: model.isBusy,
        child: Form(
          key: model.formKey,
          child: GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 54),
                  Center(
                    child: AppText.heading4M(
                      "Verify Email",
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppText.textFieldM(
                    "Enter the code sent to your email.",
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    obscureText: false,
                    length: 6,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      inactiveColor: Colors.grey,
                      activeColor: kPrimaryColor,
                      selectedColor: kSecondaryColor,
                      disabledColor: Colors.grey,
                      inactiveFillColor: Colors.grey,
                      activeFillColor: Colors.grey,
                      errorBorderColor: Colors.red,
                      fieldHeight: 55,
                      fieldWidth: 55,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "OTP Code cannot be empty";
                      } else if (value.length < 5) {
                        return "Please completly fill your OTP code";
                      }
                      return null;
                    },
                    animationDuration: const Duration(milliseconds: 300),
                    // backgroundColor: Colors.blue.shade50,
                    enableActiveFill: false,
                    // errorAnimationController: model.controller,
                    controller: model.pinController,
                    onCompleted: (v) {
                      model.pinController.text = v;
                    },
                    onChanged: (value) {},
                    // beforeTextPaste: (text) {
                    //   print("Allowing to paste $text");
                    //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    //   return true;
                    // },
                  ),
                  const Spacer(),
                  AppButton.purple(
                    title: "Verify",
                    onTap: model.toCreateAccount,
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
