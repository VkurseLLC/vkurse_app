//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'package:flutter/material.dart';

//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:url_launcher/link.dart';
import 'package:flutter/foundation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import '../generated/locale_keys.g.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
import 'package:vkurse_app/pages/auth_verification_code.dart';



// Класс для отображения страницы перехода к боту

class AuthGetVerificationCode extends StatefulWidget {
  const AuthGetVerificationCode({Key? key}) : super(key: key);
  
  @override
  State<AuthGetVerificationCode> createState() => _AuthGetVerificationCodeState();

}

class _AuthGetVerificationCodeState extends State<AuthGetVerificationCode> {

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width, height = mediaQuery.size.height;

    return Scaffold(
      body: Column(
        children: [
          Row(
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
                      left: width * 0.025,
                      child: SizedBox(
                        width: width * 0.2,
                        height: width * 0.2,
                        child: IconButton(
                          onPressed: () async {
                            await Navigator.pushNamed(context, '/auth');
                          }, 
                          icon: const Icon(Icons.arrow_back_ios_new),
                          iconSize: width * 0.1,
                          color: Color(0xF0DADADA),
                        )
                      )
                    ),

                    Positioned(
                      child: Container(
                        height: width * 0.4,
                        width: width * 0.4,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo_pic_white.png"),
                          opacity: 0.4,
                          )
                        ),
                      )
                    )
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: width * 0.8718,
                              height: width * 0.2583,
                              child: const AutoSizeText(
                                "Для продолжения Вам необходимо получить код подтверждения в нашем Телеграмм-боте",
                                maxLines: 5,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xF0894EB8),
                                  fontSize: 40,
                                  fontFamily: "Comfortaa",
                                  fontWeight: FontWeight.bold
                                ),
                              ), 
                            ),
                          ],
                        )
                      ),

                      Expanded(
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
                                  child: Link(
                                    target: LinkTarget.blank,
                                    uri: Uri.parse("https://t.me/VkurseAppBot"),
                                    builder: (context, followLink) => ElevatedButton(            
                                      onPressed: followLink,
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(width * 0.039),
                                          ),
                                        ),
                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xE6350068)),
                                      ),

                                      child: SizedBox(
                                        width: width * 0.4385,
                                        height: width * 0.0564,
                                        child: const AutoSizeText(
                                          'Телеграмм-бот',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 60,
                                            fontFamily: "Comfortaa",
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      )
                                    ),
                                  ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ],
                  )
                )
              ],
            )
          ),

          Expanded(
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
                      
                      onPressed:() async {
                        await Navigator.pushNamed(context, '/auth_post_verification_code');
                      },

                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                           RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(width * 0.039),
                           ),
                         ),
                         backgroundColor: MaterialStateProperty.all<Color>(Color(0xF0894EB8))                  
                      ),
                      child: SizedBox(
                        width: width * 0.3692,
                        height: width * 0.0564,
                        child: const AutoSizeText(
                          'Продолжить',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 60,
                            fontFamily: "Comfortaa",
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ) 
          )
        ],
      ),
    );
  }
}