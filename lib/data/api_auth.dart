import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:loginwithapi/views/dashboard.dart';
// import 'package:loginwithapi/views/welcome.dart';

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
      } else {
        await EasyLoading.showError(json['answer']);
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => Dashboard()));
        }
    } else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
      }
  }
}