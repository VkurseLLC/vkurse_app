import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';


class AccountDataApi {
  static final _client = http.Client();

  static var api_authorisation = Uri.parse('http://80.78.240.205:5000/check_username_availability');

  static check_username(username, context) async {
    http.Response response = await _client.post(api_authorisation, body: {
      "username": username,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json['answer'] == 'successful') {
        if (json['username'] == 'True') {
          return true;
        } else {
          return false;
        }
      } else {
        await EasyLoading.showError(json['answer']);
        }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
      }
  }
}