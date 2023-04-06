//?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

// import '../generated/locale_keys.g.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
// import 'package:vkurse_app/pages/auth_verification_code.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

// Класс для отображения страницы перехода к боту
class EndProfileFilling extends StatefulWidget {
  const EndProfileFilling({Key? key}) : super(key: key);

  @override
  State<EndProfileFilling> createState() => _EndProfileFilling();
}

class _EndProfileFilling extends State<EndProfileFilling> {
  // bool isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width,
                  height: height * 0.3,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: SizedBox(
                          width: width,
                          height: height * 0.3,
                          child: CustomPaint(
                            foregroundPainter: HeaderPainter(),
                          ),
                        ),
                      ),
                      Positioned(
                          child: Container(
                        height: width * 0.35,
                        width: width * 0.35,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/logo_pic_white.png"),
                          opacity: 0.4,
                        )),
                      ))
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: width * 0.8718,
                              height: width * 0.2808,
                              child: const AutoSizeText('Настройка завершена!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF6F2EAE),
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Comfortaa",
                                  )),
                            ),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: width * 0.6538,
                              height: width * 0.1333,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(70, 0, 0, 0),
                                      blurRadius: width * 0.0608,
                                      offset: Offset(0.0, width * 0.0243)),
                                ],
                              ),
                              child: Opacity(
                                opacity: 0.9,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/map');
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                width * 0.039),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Color(0xF0894EB8))),
                                    child: SizedBox(
                                      width: width * 0.3692,
                                      height: width * 0.0564,
                                      child: const AutoSizeText(
                                        'Начать',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontFamily: "Comfortaa",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        ))
                  ],
                ))
              ],
            ))
          ],
        ));

    Expanded(
        child: Row(
      children: [],
    ));
  }
}
