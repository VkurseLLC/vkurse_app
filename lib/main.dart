import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:vkurse_app/ui/main_navigation.dart';
// import 'package:vkurse_app/utils/theme.dart';

import 'generated/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // runApp(const MyApp());
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ru')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('ru'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}


class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

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

      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(false),
      builder: EasyLoading.init(),
    );
  }
}
