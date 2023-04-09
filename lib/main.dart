//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\
import 'generated/codegen_loader.g.dart';
import 'package:vkurse_app/ui/main_navigation.dart';

//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final model = CheckAuth();
  await model.checkAuth();
  

  // runApp(const MyApp());
  runApp(
    
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ru')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('ru'),
        assetLoader: CodegenLoader(),
        child: MyApp(model: model)),
  );
}


class MyApp extends StatelessWidget {
  final CheckAuth model;
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VKURSE',

      localizationsDelegates: const [
        // ... app-specific localization delegate[s] here
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('ru', 'RU'), // English
      ],

      locale: context.locale,
      theme: ThemeData(),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      builder: EasyLoading.init(),
    );
  }
}
