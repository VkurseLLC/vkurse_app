import 'package:flutter/material.dart';
import 'package:vkurse_app/pages/welcome.dart';
import 'package:vkurse_app/pages/auth_phone_number.dart';
import 'package:vkurse_app/pages/auth_get_verification_code.dart';
import 'package:vkurse_app/pages/loading.dart';
import 'package:vkurse_app/pages/map.dart';

abstract class MainNavigationRoutNames {
  static const auth = '/auth';
  static const map = '/map';
  static const bot = '/bot';
  static const phone = '/phone';
}

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRoutNames.map : MainNavigationRoutNames.auth;

  final routes = <String, Widget Function(BuildContext)>{
    '/auth': (context) => const AuthProvider(),
    '/phone': (context) => const GetPhoneNumber(),
    '/map': (context) => const Map(),
    '/bot': (context) => const ToBot(),
  };
}
