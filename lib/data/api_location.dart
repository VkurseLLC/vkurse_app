import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocationApi {
  static final _client = http.Client();

  static var api_save_location = Uri.parse('http://80.78.240.205:5000/api/save/location');

  static user_location_save(user_id, latitude, longitude) async {
    http.Response response = await _client.post(api_save_location, body: {
      "user_id": user_id,
      "latitude": latitude,
      "longitude": longitude,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      if (json['answer'] == 'successful') {

      } else {
        await EasyLoading.showError(json['answer']);
        }

    } else {
      await EasyLoading.showError("Error Code : ${response.statusCode.toString()}");
      }
  }

  static var api_stream_location = Uri.parse('http://80.78.240.205:5000/api/stream/location');

  static users_location_stream(user_id) async {
    http.Response response = await _client.post(api_stream_location, body: {
      "user_id": user_id,
    });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      if (json["answer"] == "successful") {
        return json["locations_data"];
      } else {
        await EasyLoading.showError(json["answer"]);
      }
      
    } else {
      await EasyLoading.showError("Error Code : ${response.statusCode.toString()}");
      }
  }
}