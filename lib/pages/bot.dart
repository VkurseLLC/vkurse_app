import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

// Класс для отображения страницы перехода к боту

void _launchUrl(url)async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

class ToBot extends StatefulWidget {
  const ToBot({Key? key}) : super(key: key);
  
  @override
  State<ToBot> createState() => _ToBot();

}

class _ToBot extends State<ToBot> {
  bool isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    // var height = mediaQuery.size.height;
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

             ///\\\ (НАЧАЛО) ///\\\ ИКОНКА "НАЗАД" ///\\\
            
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),

                Column(
                  children: [
                    Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(25, 0, 0, 0),
                            blurRadius: 20,
                          )
                        ]
                      ),
                      child: IconButton(
                        onPressed: (){
                          Navigator.pushNamed(
                                context, 
                                "/auth");
                        }, 
                        icon: const Icon(Icons.arrow_back),
                        iconSize: width * 0.05,
                        color: Color(0xFF000000),
                      )
                    )
                  ],
                )
              ],
            ),

             //!\\\ (КОНЕЦ) ///\\\ ИКОНКА "НАЗАД" ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
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
                ],
              )
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
                        // color: Colors.amber,
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

                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),

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
                            onPressed: () {
                              var url = "https://t.me/VkurseAppBot";
                              _launchUrl(url);
                              setState(() => isButtonActive = true);
                            }, 

                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),

                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF350068)),
                            ),

                            child:
                            AutoSizeText(
                                'Телеграм-бот',
                                style: TextStyle(
                                  fontSize: fontSizeButton,
                                  fontFamily: "assets/fonts/Inter-Regular.ttf",
                                  fontWeight: FontWeight.bold),
                            )
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

                          onPressed: isButtonActive ? (){
                          
                          } 
                          : null,

                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),

                            backgroundColor: isButtonActive ? 
                            MaterialStateProperty.all<Color>(Color(0xFF6F2EAE)) 
                            : MaterialStateProperty.all<Color>(Color(0xFF808080))

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