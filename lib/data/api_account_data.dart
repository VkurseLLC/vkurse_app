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

  static var api_save_filling_profile = Uri.parse('http://80.78.240.205:5000/filling_profile');

  static save_filling_profile(context, user_id, username, first_name, city, d_birth) async {
    http.Response response = await _client.post(api_check_username_availability, body: {
      "users_id": user_id,
      "username": username,
      "first_name": first_name,
      "d_birth": d_birth,
      "city": city,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
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

}