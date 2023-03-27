import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_test/flutter_test.dart';

class ProfileDataApi {
  static final _client = http.Client();

  static var api_show_profile =
      Uri.parse('http://172.20.10.5:5000/api/user_profile/show_profile');

  static show_profile(user_id) async {
    // String json = '{"users_id": ${user_id}}';
    http.Response response = await _client.post(api_show_profile, body: {
      "users_id": user_id,
    });
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json;
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}
