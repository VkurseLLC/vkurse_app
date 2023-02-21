import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../generated/locale_keys.g.dart';
// import 'package:vkurse_app/generated/locale_keys.g.dart';

// import 'generated/locale_keys.g.dart';

// Основной класс для отображения страницы авторизации - ввод номера
class AuthProvider extends StatelessWidget {
  const AuthProvider({Key? key}) : super(key: key);

  // Ниже нужно прописывать структуру виджетов
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Авторизация', ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 146, 6, 228),
        leading: IconButton(
          icon: Icon(Icons.language), 
          onPressed: () {
            if (context.locale == Locale('ru')) {
              context.setLocale(Locale('en'));
            } else {
              context.setLocale(Locale('ru'));
            }
            print(LocaleKeys.Authorisation.tr());
          },
        ),
      ),

      body: Center(
        child:
          Text(
            LocaleKeys.Authorisation.tr(),
            style: TextStyle(color: Colors.white),
          ),
      ),
    );
  }
}