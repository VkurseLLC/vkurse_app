import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';


class CitySelectionApi {
  static final _client = http.Client();

  static var api_city_selection = Uri.parse("http://80.78.240.205:5000/city_selection");

  static get_names_city() async {
    http.Response response = await _client.get(api_city_selection);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json;
    } 
    else {
      await EasyLoading.showError(
          "Error Code : ${response.statusCode.toString()}");
    }
  }
}