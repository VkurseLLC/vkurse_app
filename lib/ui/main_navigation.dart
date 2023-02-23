
import 'package:flutter/material.dart';
import 'package:vkurse_app/pages/authorization.dart';
import 'package:vkurse_app/pages/map.dart';

abstract class MainNavigationRoutNames {
  static const auth = '/auth';
  static const map = '/map';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth ?
  MainNavigationRoutNames.map :
  MainNavigationRoutNames.auth;
  
  final routes = <String, Widget Function(BuildContext)> {
    '/auth': (context) => const AuthProvider(),
    '/map' : (context) => const Map(),
  };
}