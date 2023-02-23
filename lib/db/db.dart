import 'dart:async';

import 'package:mysql1/mysql1.dart';

Future main() async {
  var settings = new ConnectionSettings(
      host: '95.163.241.100',
      port: 3306,
      user: 'super_user',
      password: '****9963AAdd',
      db: 'vkurse_database');

  var conn = await MySqlConnection.connect(settings);

  var user_phone = 1;
  var result = await conn.query(
      'select phone_number, code from phone_number_verification_codes where id = ?',
      [user_phone]);

  for (var number in result) {
    print('Phone: ${number[0]},code: ${number[1]}');
  }

  await conn.close();
}
