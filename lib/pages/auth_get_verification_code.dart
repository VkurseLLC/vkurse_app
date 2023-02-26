import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vkurse_app/pages/auth_verification_code.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// Класс для отображения страницы перехода к боту
final _url = Uri.parse("https://t.me/VkurseAppBot");

void _launchUrl(_url)async {
  if (await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class AuthGetVerificationCode extends StatefulWidget {
  const AuthGetVerificationCode({Key? key}) : super(key: key);
  
  @override
  State<AuthGetVerificationCode> createState() => _AuthGetVerificationCodeState();

}

class _AuthGetVerificationCodeState extends State<AuthGetVerificationCode> {
  // bool isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;
    var buttonWidth = width * 0.65;
    var buttonHeight = buttonWidth * 0.20;

    var widthText = width * 0.85;
    var heightText = widthText * 0.2;
    double fontSizeButton = 16.0;
    double fontSizeText = 20.0;

    if(width <= 300)
    {
        fontSizeText = 22.0;
        fontSizeButton = 16.0;

    }
    else if (width > 300 && width <= 700) 
    {
        fontSizeText = 30.0;
        fontSizeButton = 20.0;

    }
    else if (width > 700 && width <= 1000) 
    {
        fontSizeText = 35.0;
        fontSizeButton = 30.0;
        widthText = width * 0.65;
        heightText = widthText * 0.2;
        buttonHeight = buttonWidth * 0.15;
    }
    else if (width > 1000) 
    {
        fontSizeText = 40.0;
        fontSizeButton = 30.0;
        widthText = width * 0.65;
        heightText = widthText * 0.2;
        buttonHeight = buttonWidth * 0.15;
    }

    print('width: $width');
    print('height: $height');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

             ///\\\ (НАЧАЛО) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
            Padding(padding: EdgeInsets.fromLTRB(0, width * 0.05, 0, 0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(padding: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0)),

                Column(
                  children: [
                    Container(
                      width: width * 0.2,
                      height: width * 0.2,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x26A0A0A0),
                            blurRadius: 20,
                          )
                        ]
                      ),
                      child: IconButton(
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/auth_get_phone_number');
                        }, 
                        icon: const Icon(Icons.arrow_back_ios_new),
                        iconSize: width * 0.1,
                        color: Color(0xFFA8A8A8),
                      )
                    )
                  ],
                ),

                Expanded(
                  child: Column(
                    children: [
                        Container(
                        height: width * 0.35,
                        width: width * 0.35,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/images/logo_pic.png"),
                            opacity: 0.4,
                            )
                          ),
                        )
                    ],
                  )
                ),
                
                Padding(padding: EdgeInsets.fromLTRB(0, 0, width * 0.2 + width * 0.05, 0)),
                
              ],
            ),

             //!\\\ (КОНЕЦ) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

            SizedBox(
              width: width * 0.2,
              height: width * 0.2,
            ),

            //!\\\ (КОНЕЦ) ///\\\ ЛОГО ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ПЕРЕХОД К БОТУ (ТЕКСТ + КНОПКА) ///\\\

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: widthText,
                        height: heightText,
                        child: AutoSizeText(
                          "Для продолжения Вам необходимо получить код подтверждения в нашем Телеграмм-боте",
                          style: TextStyle(
                            color: Color(0xFF6F2EAE),
                            fontSize: fontSizeText,
                            fontFamily: "assets/fonts/Inter-Bold.ttf",
                            fontWeight: FontWeight.bold
                            ),
                          textAlign: TextAlign.center,
                          maxLines: 5,
                        ),),

                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, width * 0.05)),
                      

                      Container(
                        width: buttonWidth,
                        height: buttonHeight,

                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(70, 0, 0, 0),
                              blurRadius: 25,
                              offset: Offset(0.0, 10.0)),
                          ],
                        ),

                        child: Opacity(
                          opacity: 0.9,
                            child: Link(
                              target: LinkTarget.blank,
                              uri: Uri.parse("http://t.me/VkurseAppBot"),
                              builder: (context, followLink) => ElevatedButton(            
                                onPressed: followLink,
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF350068)),
                                ),
                                child: AutoSizeText(
                                  'Телеграм-бот',
                                  style: TextStyle(
                                    fontSize: fontSizeButton,
                                    fontFamily: "assets/fonts/Inter-Regular.ttf",
                                    fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ),

            //!\\\ (КОНЕЦ) ///\\\ ПЕРЕХОД К БОТУ (ТЕКСТ + КНОПКА) ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ КНОПКА "ПРОДОЛЖИТЬ" ///\\\

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(70, 0, 0, 0),
                              blurRadius: 25,
                              offset: Offset(0.0, 10.0)),
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
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6F2EAE))
                            ),

                            child:
                            AutoSizeText(
                                'Продолжить',
                                style: TextStyle(
                                  fontSize: fontSizeButton,
                                  fontFamily: "assets/fonts/Inter-Regular.ttf",
                                  fontWeight: FontWeight.bold),
                            )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: width * 0.25,
                      )
                    ],
                  )
                ],
              )
            ),
            //!\\\ (КОНЕЦ) ///\\\ КНОПКА "ПРОДОЛЖИТЬ" ///\\\

          ]
        ),
      ),
    );
  }
}