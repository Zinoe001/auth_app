import 'package:auth_app/core/utils/colors.dart';
import 'package:auth_app/views/splash/components/show_sheet.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => showSheet(context),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                          child: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 35,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              )
            ],
          ),
        ),
      ),
    );
  }
}
