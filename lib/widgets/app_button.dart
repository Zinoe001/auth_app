import 'package:auth_app/core/utils/text.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  static const Color _kSecondary = Color(0XFF7A085D);
  static final Color _kPrimary = const Color(0XFFEA1CB5).withOpacity(0.2);
  final String title;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final bool showBoxShadow;
  final bool showBorder;
  final Color textColor;
  final Function()? onTap;
  final bool isDisabled;
  const AppButton(
      {Key? key,
      required this.title,
      this.backgroundColor = _kSecondary,
      this.showBorder = false,
      this.textColor = Colors.white,
      this.onTap,
      this.showBoxShadow = false,
      this.height = 50,
      this.isDisabled = false,
      this.width})
      : super(key: key);

  const AppButton.white({
    Key? key,
    required this.title,
    this.isDisabled = false,
    this.showBoxShadow = false,
    this.showBorder = false,
    this.onTap,
    this.height,
    this.width,
  })  : backgroundColor = Colors.white,
        textColor = _kSecondary,
        super(key: key);

  const AppButton.purple({
    Key? key,
    required this.title,
    this.showBoxShadow = true,
    this.showBorder = false,
    this.onTap,
    this.height,
    this.isDisabled = false,
    this.width,
  })  : backgroundColor = _kSecondary,
        textColor = Colors.white,
        super(key: key);
  AppButton.lightpurple({
    Key? key,
    required this.title,
    this.showBoxShadow = true,
    this.showBorder = false,
    this.onTap,
    this.height,
    this.isDisabled = false,
    this.width,
  })  : backgroundColor = _kPrimary,
        textColor = _kSecondary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.none,
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey.shade100 : backgroundColor,
          border: showBorder
              ? Border.all(
                  color: backgroundColor,
                  width: 1.0,
                  style: BorderStyle.solid,
                )
              : const Border.fromBorderSide(BorderSide.none),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: AppText.heading6M(
            title,
            color: isDisabled ? Colors.grey.shade400 : textColor,
          ),
        ),
      ),
    );
  }
}
