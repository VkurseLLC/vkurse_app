import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';


class AccountDataApi {
  static final _client = http.Client();

  static var api_check_username_availability = Uri.parse('http://80.78.240.205:5000/check_username_availability');

  static check_username(username, context) async {
    http.Response response = await _client.post(api_check_username_availability, body: {
      "username": username,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['answer'] == 'successful') {
        if (json['username'] == 'True') {
          return false;
        } else {
          return true;
        }
      } else {
        await EasyLoading.showError(json['answer']);
        }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
      }
  }

  static var api_save_filling_profile = Uri.parse('http://80.78.240.205:5000/api/user_profile/filling_profile');

  static save_filling_profile(context, _user_id, _username, _name, _surname, _d_birth, _city) async {
    http.Response response = await _client.post(api_save_filling_profile, body: {
      "users_id": _user_id,
      "username": _username,
      "name": _name,
      "surname": _surname,
      "d_birth": _d_birth,
      "city": _city,
    });
    
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print("json: $json");
      if (json['answer'] == 'successful') {
        await Navigator.pushNamed(context, '/initial_setting_accaunt_completed');
      } 
      
      else if (json['answer'] == 'username_is_taken') {
        await EasyLoading.showInfo("Выбранный username занят");
        await Navigator.pushNamed(context, '/initial_setting_username');
      }

      else {
        await EasyLoading.showError("Ошибка запроса к API");
      }
    }
    else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }


  }

  static var api_view_filling_profile = Uri.parse('http://80.78.240.205:5000/api/user_profile/show_profile');

  static view_user_data_profile (_user_id) async {
    http.Response response = await _client.post(api_view_filling_profile, body: {
      "users_id": _user_id,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      print("view_user_data_profile: $json");
      return json;
      
    } else {
      await EasyLoading.showError("Ошибка API");
      }

  }

}