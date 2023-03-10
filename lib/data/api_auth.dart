import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';


class AuthApi {
  static final _client = http.Client();

  static var api_authorisation = Uri.parse('http://80.78.240.205:5000/authorisation');

  static user_authorisation(phone_number, verification_code, context) async {
    http.Response response = await _client.post(api_authorisation, body: {
      "phone_number": phone_number,
      "verification_code": verification_code,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      if (json['answer'] == 'successful') {
        await EasyLoading.showSuccess("user_id: ${json['user_id'].toString()}");

        if (json['user_account_status'] == 'new_user') {
          await Navigator.pushNamed(context, '/initial_setting_username');
        }
        else if (json['user_account_status'] == 'old_user') {

        }

      } 
      else {
        await EasyLoading.showError(json['answer']);
      }
    } 
    else {
      await EasyLoading.showError("Error Code : ${response.statusCode.toString()}");
      }
  }
}


