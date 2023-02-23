import 'package:mysql_client/mysql_client.dart';

Future main() async {
  print("Connection to mySql server...");

  //connection
  final conn = await MySQLConnection.createConnection(
      host: "95.163.241.100",
      port: 3306,
      userName: "super_user",
      password: "****9963AAdd",
      databaseName: "vkurse_database");

  await conn.connect();
  print("Connected");

  var result = await conn.execute(
      "SELECT phone_number, verification_code FROM phone_number_verification_codes");

  print(result.numOfColumns);
  print(result.numOfRows);
  print(result.lastInsertID);
  print(result.affectedRows);

  for (final row in result.rows) {
    print(row.assoc());
  }

  await conn.close();
}
