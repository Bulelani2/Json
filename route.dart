import 'package:flutter/material.dart';
import 'package:units_app/pages/main_page.dart';
import 'package:units_app/pages/second_page.dart';

class RouteManager {
  static const String homepage = "/";
  static const String secondpage = "/secondPage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var valuePassed;
    if (settings.arguments != null) {
      valuePassed = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case homepage:
        return MaterialPageRoute(
          builder: (context) => const Mainpage(),
        );

      case secondpage:
        return MaterialPageRoute(
          builder: (context) => const SecondPage(),
        );

      default:
        throw const FormatException("Route not found!!");
    }
  }
}
