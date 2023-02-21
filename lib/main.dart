import 'package:flutter/material.dart';
import 'package:vkurse_app/pages/authorization.dart';
import 'package:vkurse_app/pages/map.dart';
import 'package:vkurse_app/ui/main_navigation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VKURSE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(false),
    );
  }
}