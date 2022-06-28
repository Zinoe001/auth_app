import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/login/login_view.dart';
import 'package:auth_app/views/auth/verification/view_model/verification_view_model.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

final _vm = ChangeNotifierProvider.autoDispose((ref) => VerificationViewModel());

class VerificationView extends ConsumerWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var model = ref.watch(_vm);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 309,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/img2.jpg",
                      ),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 82),
                child: Column(),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.heading1SB(
                      "Verify Email",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppText.captionM(
                      "Enter the code sent to your email.",
                      // {model.email}
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: model.formKey,
                      child: PinCodeTextField(
                        // controller: model.otpController,
                        appContext: context,
                        length: 6,
                        onChanged: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "OTP Code cannot be empty";
                          } else if (value.length < 5) {
                            return "Please completly fill your OTP code";
                          }
                          return null;
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldWidth: 45,
                          inactiveColor: Colors.grey,
                          activeColor: Colors.grey,
                          selectedColor: kPrimaryColor,
                          errorBorderColor: Colors.red,
                        ),
                      ),
                    ),
                    const Spacer(),
                    AppButton.purple(
                       onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginView())),
                      title: "Continue",
                      height: 50,
                      // onTap: model.sendOTP,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
