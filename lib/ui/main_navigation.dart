//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\
import 'package:flutter/material.dart';
import 'package:vkurse_app/pages/friend_window_cart.dart';
import 'package:vkurse_app/pages/friends.dart';
import 'package:vkurse_app/pages/know_friend.dart';
import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\
import 'package:vkurse_app/pages/welcome.dart';
import 'package:vkurse_app/pages/auth_phone_number.dart';
import 'package:vkurse_app/pages/auth_get_verification_code.dart';
import 'package:vkurse_app/pages/auth_verification_code.dart';
import 'package:vkurse_app/pages/input_username.dart';
import 'package:vkurse_app/pages/profile.dart';
import 'package:vkurse_app/pages/profile_filling.dart';
import 'package:vkurse_app/pages/end_profile_filling.dart';
import 'package:vkurse_app/pages/map.dart';
// import 'package:vkurse_app/pages/loading.dart';
import 'package:vkurse_app/pages/test_Nikita.dart';
import 'package:vkurse_app/pages/testDmitriy.dart';

import '../pages/unknow_friend.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\




class CheckAuth {
  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<bool> checkAuth() async {
    var prefs = await SharedPreferences.getInstance();
    var user_id = prefs.getString('user_id');

    if (user_id == null) {
      return _isAuth = false;
    } else {
      return _isAuth = true;
    }
  }
}


abstract class MainNavigationRoutNames {
  static const auth = '/auth';
  static const map = '/map';
}

class MainNavigation {
  String initialRoute(bool isAuth) =>
      isAuth ? MainNavigationRoutNames.map : MainNavigationRoutNames.auth;

  // static test() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var user_id = prefs.getString('user_id');

  //   if (user_id == null) {
  //     return MainNavigationRoutNames.auth;
  //   } else {
  //     return MainNavigationRoutNames.map;
  //   }
  // }


  final routes = <String, Widget Function(BuildContext)>{
    // Написанное ниже не трогать !!!
    '/auth': (context) => const AuthProvider(),
    '/auth_get_phone_number': (context) => const GetPhoneNumber(),
    '/auth_get_verification_code': (context) => const AuthGetVerificationCode(),
    '/auth_post_verification_code': (context) => const AuthVerificationCode(),

    '/initial_setting_username': (context) => const InputUsername(),
    '/initial_setting_accaunt_data': (context) => const ProfileFilling(),
    '/initial_setting_accaunt_completed': (context) => const EndProfileFilling(),

    '/profile': (context) => const Profile(),

    '/profile_edit': (context) => const ProfileEdit(),

    '/map': (context) => Map(),

    // Если нужно затестить свой экран, то разкомитьте следующую строку и вместо > AuthProvider < вставьте нужный класс
    // '/auth': (context) => const FriendWindowCard(),
  };
}
