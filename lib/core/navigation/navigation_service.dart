import 'package:flutter/material.dart';

class NavigationService {
  NavigationService._();
  static final NavigationService _instance = NavigationService._();
  static NavigationService get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {Object? argument}) async {
    return await
     navigatorKey.currentState!
        .pushNamed(routeName, arguments: argument);
  }

  Future<dynamic> navigateToReplace(String routeName, {Object? argument}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: argument);
  }

  // Future<dynamic> navigateToNewRoute(String routeName, {Object? argument}) {
  //   return navigatorKey.currentState!
  //       .pushNamedAndRemoveUntil(routeName, (r) => false, arguments: argument);
  // }

  // Future<dynamic> logOut(String routeName, {Object? argument}) {
  //   // navigatorKey.currentState.
  //   return navigatorKey.currentState!
  //       .pushReplacementNamed(routeName, arguments: argument);
  // }

  navBack() {
    Navigator.of(navigatorKey.currentState!.context).pop();
  }
}
