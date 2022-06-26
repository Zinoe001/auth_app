import 'package:flutter/material.dart';


Color kBackgroundColor =  const Color(0XFF1A2232);

Map<int,Color> _primaryColor = {
  50: const Color(0XFFEA1CB5).withOpacity(0.1),
  100: const Color(0XFFEA1CB5).withOpacity(0.2),
  200: const Color(0XFFEA1CB5).withOpacity(0.3),
  300: const Color(0XFFEA1CB5).withOpacity(0.4),
  400: const Color(0XFFEA1CB5).withOpacity(0.5),
  500: const Color(0XFFEA1CB5).withOpacity(0.6),
  600: const Color(0XFFEA1CB5).withOpacity(0.7),
  700: const Color(0XFFEA1CB5).withOpacity(0.8),
  800: const Color(0XFFEA1CB5).withOpacity(0.9),
  900: const Color(0XFFEA1CB5)
};

final MaterialColor kPrimaryColor = MaterialColor(0XFFEA1CB5, _primaryColor);

Map<int,Color> _secondaryColor = {
  50: const Color(0XFF7A085D).withOpacity(0.1),
  100: const Color(0XFF7A085D).withOpacity(0.2),
  200: const Color(0XFF7A085D).withOpacity(0.3),
  300: const Color(0XFF7A085D).withOpacity(0.4),
  400: const Color(0XFF7A085D).withOpacity(0.5),
  500: const Color(0XFF7A085D).withOpacity(0.6),
  600: const Color(0XFF7A085D).withOpacity(0.7),
  700: const Color(0XFF7A085D).withOpacity(0.8),
  800: const Color(0XFF7A085D).withOpacity(0.9),
  900: const Color(0XFF7A085D)
};

final MaterialColor kSecondaryColor = MaterialColor(0XFF7A085D, _secondaryColor);

Color kSkelenton = Colors.black.withOpacity(0.4);

Color kBGColor = const Color(0XFF1A2232);