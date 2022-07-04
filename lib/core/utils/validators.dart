import 'package:auth_app/core/utils/text_extention.dart';

class Validators {

  static String? phoneNumber(String? value) {
    String title = "phone number";
    String reg = "^(?:[+0]9)?[0-9]{10}";
    if (value == null || value.isEmpty) {
      return "$title can not be empty".capitalize();
    } else {
      // check length of string
      RegExp regExp = RegExp(reg);
      if (!regExp.hasMatch(value)) {
        return "please enter a valid $title".capitalize();
      } else {
        return null;
      }
    }
  }

  static String? password(String? value) {
    String title = "password";
    if (value == null || value.isEmpty) {
      return "$title can not be empty".capitalize();
    } else {
      // check length of string
      if (value.length <= 7) {
        // print(value.length);
        return "$title must be at least 8 chars".capitalize();
      } else {
        return null;
      }
    }
  }

  static String? email(String? value) {
    String title = "email";
    String reg =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value == null || value.isEmpty) {
      return "$title can not be empty".capitalize();
    } else {
      // check length of string
      RegExp regExp = RegExp(reg);
      if (!regExp.hasMatch(value)) {
        return "Please enter a valid $title".capitalize();
      } else {
        return null;
      }
    }
  }

  static String? firstName(String? value) {
    String title = "First";
    if (value == null || value.isEmpty) {
      return "$title can not be empty".capitalize();
    } else {
      // check length of string
      String first = value;
      if (first.length < 3) {
        return "each name must be atleast 3+ chars".capitalize();
      } else {
        return null;
      }
    }
  }

  static String? lastName(String? value) {
    String title = "Last Name";
    if (value == null || value.isEmpty) {
      return "$title can not be empty".capitalize();
    } else {
      // check length of string
      String last = value;
      if (last.length < 3) {
        return "each name must be atleast 3+ chars".capitalize();
      } else {
        return null;
      }
    }
  }
}
