import 'package:auth_app/core/utils/text.dart';
import 'package:auth_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool isPassword;
  final String hintText;
  final Function(String v)? onValueChnaged;
  final IconData icon;
  final List<TextInputFormatter> inputFormatters;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  const AuthTextField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      this.onValueChnaged,
      this.isPassword = false,
      required this.hintText,
      required this.icon,
      this.validator,
      this.inputFormatters = const [],
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.textFieldR(
          title,
          color: const Color(0xff4F4F4F),
        ),
        const SizedBox(height: 4),
        AppTextField(
          keyboardType: keyboardType,
          onValueChanged: onValueChnaged,
          controller: controller,
          validator: validator,
          showPrefixIcon: true,
          enableBorder: true,
          icon: icon,
          iconColor: const Color(0xff4F4F4F),
          hText: hintText,
          isPassword: isPassword,
          inputFormatters: inputFormatters,
          maxLines: 1,
          height: 52,
        ),
      ],
    );
  }
}
