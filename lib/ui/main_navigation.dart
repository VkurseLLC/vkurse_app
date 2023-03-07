import 'package:flutter/material.dart';
import 'package:vkurse_app/pages/auth_phone_number.dart';
import 'package:vkurse_app/pages/auth_verification_code.dart';
import 'package:vkurse_app/pages/profile_filling.dart';
import 'package:vkurse_app/pages/auth_get_verification_code.dart';
import 'package:vkurse_app/pages/map.dart';
import 'package:vkurse_app/pages/test.dart';
import 'package:vkurse_app/pages/end_profile_filling.dart';

import 'package:vkurse_app/pages/welcome.dart';
import 'package:vkurse_app/pages/auth_phone_number.dart';
import 'package:vkurse_app/pages/loading.dart';
import 'package:vkurse_app/pages/input_username.dart';

abstract class MainNavigationRoutNames {
  static const auth = '/auth';
  static const map = '/map';
}

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRoutNames.map : MainNavigationRoutNames.auth;

  final routes = <String, Widget Function(BuildContext)>{
    // Написанное ниже не трогать !!!
    '/auth': (context) => const AuthProvider(),
    '/auth_get_phone_number': (context) => const GetPhoneNumber(),
    '/auth_get_verification_code': (context) => const AuthGetVerificationCode(),
    '/auth_post_verification_code': (context) => const AuthVerificationCode(),

    '/map': (context) => const Map(),

    // Если нужно затестить свой экран, то разкомитьте следующую строку и вместо > AuthProvider < вставьте нужный класс
    '/auth': (context) => AuthVerificationCode(),
  };
}
