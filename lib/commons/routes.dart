import 'package:flutter/material.dart';
import 'package:register_and_login/screens/forgot_password.dart';
import 'package:register_and_login/screens/login.dart';
import 'package:register_and_login/screens/register.dart';

const String ROUTE_LOGIN = "/login";
const String ROUTE_REGISTER = "/register";
const String ROUTE_FORGOT_PASSWORD = "/forgot_password";

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (_) => const Login());
      case "/register":
        return MaterialPageRoute(builder: (_) => const Register());
      case "/forgot_password":
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      default:
        return MaterialPageRoute(builder: (_) => const Login());
    }
  }
}
