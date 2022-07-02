import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/views/auth/login_view.dart';
import 'package:auth_app/views/auth/signup_view.dart';
import 'package:auth_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

showSheet(context) {
  return showModalBottomSheet(
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: kBGColor,
    clipBehavior: Clip.hardEdge,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: 200,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            AppButton.white(
              title: "Login",
              onTap: () {
                //close bottom sheet
                // _navigationService.goBack();
                // NavigationService.instance.navigateToReplace(LoginViewRoute);

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
            ),
            const SizedBox(
              height: 13,
            ),
            AppButton.purple(
              title: "SignUp",
              onTap: () {
                //close bottom sheet
                // _navigationService.goBack();
                // _navigationService
                //     .navigateToReplace(EmailVerificationViewRoute);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SignUpView()));
              },
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white,
                    size: 15,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  AppText.captionM("Check out our privacy policy.",
                      color: Colors.white)
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}
