import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:vkurse_app/pages/auth_get_verification_code.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// Класс для отображения страницы перехода к боту
// final _url = Uri.parse("https://t.me/VkurseAppBot");

// void _launchUrl(_url)async {
//   if (await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }

class GetPhoneNumber extends StatefulWidget {

  const GetPhoneNumber({Key? key}) : super(key: key);
  
  @override
  State<GetPhoneNumber> createState() => _GetPhoneNumber();

}

class _GetPhoneNumber extends State<GetPhoneNumber> {

  bool isButtonActive = false;
  late TextEditingController controller;
  late String field_phone_number;

  late int _PhoneNumberLength = 10;

  String initialCountry = 'RU';
  PhoneNumber number = PhoneNumber(isoCode: 'RU');

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      
    });
  }

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
        fontSizeText = 16.0;
        fontSizeButton = 16.0;

    }
    else if (width > 300 && width <= 700) 
    {
        fontSizeText = 22.0;
        fontSizeButton = 20.0;

    }
    else if (width > 700 && width <= 1000) 
    {
        fontSizeText = 26.0;
        fontSizeButton = 30.0;
        widthText = width * 0.65;
        heightText = widthText * 0.2;
        buttonHeight = buttonWidth * 0.15;
    }
    else if (width > 1000) 
    {
        fontSizeText = 30.0;
        fontSizeButton = 30.0;
        widthText = width * 0.65;
        heightText = widthText * 0.2;
        buttonHeight = buttonWidth * 0.15;
    }

    // print('width: $width');
    // print('height: $height');

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                          await Navigator.pushNamed(context, '/auth');
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

            ///\\\ (НАЧАЛО) ///\\\ ПОЛЕ ДЛЯ ВВОДА НОМЕРА + ТЕКСТ ///\\\

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        child: AutoSizeText(
                          "Введите номер телефона",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: fontSizeText,
                            fontFamily: "assets/fonts/Inter-Bold.ttf",
                            ),
                          textAlign: TextAlign.center,
                        ),),

                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, width * 0.02)),
                      
                      ////////// ПОЛЕ ВВОДА НОМЕРА ТЕЛЕФОНА ////////// 
                      Container(
                        width: width * 0.75,
                        // height: (width * 0.7) * 0.3,
                        height: (width * 0.7) * 0.23,
                        // color: Colors.amber,

                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black.withOpacity(0.13)),

                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffeeeeee),
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),

                          
                          child: Stack(
                            children: [
                              InternationalPhoneNumberInput(
                               
                                onInputChanged: (PhoneNumber number) {
                                  print(number.phoneNumber);
                                  field_phone_number = "${number.phoneNumber}";
                                },
                                
                                onInputValidated: (bool value) {
                                    print(value);
                                },

                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                ),
                                // locale: "RU",
                                // countries: ["RU", "US"],
                                initialValue: number,
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle: TextStyle(color: Colors.black),
                                textFieldController: controller,
                                formatInput: false,
                                maxLength: _PhoneNumberLength,
                                keyboardType:TextInputType.numberWithOptions(signed: true, decimal: true),
                                cursorColor: Colors.black,

                                inputDecoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                                  border: InputBorder.none,
                                  hintText: '(999) 999-99-99',
                                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                                ),

                                // onSaved: (PhoneNumber number) {
                                //   print('On Saved: $number');
                                // },
                              ),
                              Positioned(
                                left: 90,
                                top: 8,
                                bottom: 8,
                                child: Container(
                                  height: 40,
                                  width: 1,
                                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.13),
                                ),
                              )
                            ],
                          ),
                        ),
                      // ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        // child: TextField(
                        //   onChanged: (value) {
                        //     field_phone_number = value;
                        //   },
                        //   style: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: fontSizeButton
                            
                        //   ),
                        //   textAlign: TextAlign.center,

                        //   // inputFormatters: [MaskTextInputFormatter(mask: "+7 (###) ###-##-##")],

                        //   keyboardType: TextInputType.phone,

                        //   decoration: InputDecoration(
                        //     counter: Offstage(),
                        //     hintText: "(___) ___-__-__",
                        //     hintStyle: TextStyle(
                        //       color: Colors.blueGrey
                        //     ),

                        //     focusedBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.blueGrey,
                        //         width: 2),
                        //       borderRadius: BorderRadius.all(Radius.circular(20)),
                        //     ),

                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: BorderSide(
                        //         color: Colors.blueGrey,
                        //         width: 2),
                        //       borderRadius: BorderRadius.all(Radius.circular(20)),
                        //     ),

                        //   ),
                        //   maxLength: 18,
                        // ),
                      )
                    ],
                  )
                ],
              ),
            ),

            //!\\\ (КОНЕЦ) ///\\\ ПОЛЕ ДЛЯ ВВОДА НОМЕРА + ТЕКСТ ///\\\
            
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

                            // В переменной > field_phone_number < хранится то, что ввел пользователь

                            var prefs = await SharedPreferences.getInstance();
                            prefs.setString('phone_number', field_phone_number);

                            await Navigator.pushNamed(context, '/auth_get_verification_code');
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






// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/link.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:vkurse_app/pages/auth_get_verification_code.dart';
// import '../generated/locale_keys.g.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // Класс для отображения страницы перехода к боту
// final _url = Uri.parse("https://t.me/VkurseAppBot");

// void _launchUrl(_url)async {
//   if (await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }


// class GetPhoneNumber extends StatefulWidget {

//   const GetPhoneNumber({Key? key}) : super(key: key);
  
//   @override
//   State<GetPhoneNumber> createState() => _GetPhoneNumber();

// }

// class _GetPhoneNumber extends State<GetPhoneNumber> {
//   bool isButtonActive = false;
//   late TextEditingController controller;

//   late String field_phone_number;

//   @override
//   void initState() {
//     super.initState();

//     controller = TextEditingController();
//     controller.addListener(() {
      
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     var width = mediaQuery.size.width;
//     var height = mediaQuery.size.height;
//     var buttonWidth = width * 0.65;
//     var buttonHeight = buttonWidth * 0.20;

//     var widthText = width * 0.85;
//     var heightText = widthText * 0.2;
//     double fontSizeButton = 16.0;
//     double fontSizeText = 20.0;

//     if(width <= 300)
//     {
//         fontSizeText = 16.0;
//         fontSizeButton = 16.0;

//     }
//     else if (width > 300 && width <= 700) 
//     {
//         fontSizeText = 22.0;
//         fontSizeButton = 20.0;

//     }
//     else if (width > 700 && width <= 1000) 
//     {
//         fontSizeText = 26.0;
//         fontSizeButton = 30.0;
//         widthText = width * 0.65;
//         heightText = widthText * 0.2;
//         buttonHeight = buttonWidth * 0.15;
//     }
//     else if (width > 1000) 
//     {
//         fontSizeText = 30.0;
//         fontSizeButton = 30.0;
//         widthText = width * 0.65;
//         heightText = widthText * 0.2;
//         buttonHeight = buttonWidth * 0.15;
//     }

//     // print('width: $width');
//     // print('height: $height');

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [

//              ///\\\ (НАЧАЛО) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
//             Padding(padding: EdgeInsets.fromLTRB(0, width * 0.05, 0, 0)),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [

//                 Padding(padding: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0)),

//                 Column(
//                   children: [
//                     Container(
//                       width: width * 0.2,
//                       height: width * 0.2,
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color(0x26A0A0A0),
//                             blurRadius: 20,
//                           )
//                         ]
//                       ),

//                       child: IconButton(
//                         onPressed: () async {
//                           await Navigator.pushNamed(context, '/auth');
//                         }, 
//                         icon: const Icon(Icons.arrow_back_ios_new),
//                         iconSize: width * 0.1,
//                         color: Color(0xFFA8A8A8),
//                       )
//                     )
//                   ],
//                 ),

//                 Expanded(
//                   child: Column(
//                     children: [
//                         Container(
//                         height: width * 0.35,
//                         width: width * 0.35,
//                         decoration: BoxDecoration(
//                             image: const DecorationImage(
//                               image: AssetImage("assets/images/logo_pic.png"),
//                             opacity: 0.4,
//                             )
//                           ),
//                         )
//                     ],
//                   )
//                 ),
                
//                 Padding(padding: EdgeInsets.fromLTRB(0, 0, width * 0.2 + width * 0.05, 0)),
                
//               ],
//             ),

//              //!\\\ (КОНЕЦ) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
//             //---------------------------------------------------------------------------------------------------------------------------------------\\

//             ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

//             SizedBox(
//               width: width * 0.2,
//               height: width * 0.2,
//             ),

//             //!\\\ (КОНЕЦ) ///\\\ ЛОГО ///\\\
            
//             //---------------------------------------------------------------------------------------------------------------------------------------\\

//             ///\\\ (НАЧАЛО) ///\\\ ПОЛЕ ДЛЯ ВВОДА НОМЕРА + ТЕКСТ ///\\\

//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         child: AutoSizeText(
//                           "Введите номер телефона",
//                           style: TextStyle(
//                             color: Color(0xFF000000),
//                             fontSize: fontSizeText,
//                             fontFamily: "assets/fonts/Inter-Bold.ttf",
//                             ),
//                           textAlign: TextAlign.center,
//                         ),),

//                       Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, width * 0.02)),

//                       Container(
//                         width: width * 0.7,
//                         height: (width * 0.7) * 0.3,
//                         color: Colors.amber,
//                         child: TextField(
//                           onChanged: (value) {
//                             field_phone_number = value;
//                           },
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: fontSizeButton
                            
//                           ),
//                           textAlign: TextAlign.center,

//                           inputFormatters: [MaskTextInputFormatter(mask: "+7 (###) ###-##-##")],

//                           keyboardType: TextInputType.phone,

//                           decoration: InputDecoration(
//                             counter: Offstage(),
//                             hintText: "+7 (___) ___-__-__",
//                             hintStyle: TextStyle(
//                               color: Colors.blueGrey
//                             ),

//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.blueGrey,
//                                 width: 2),
//                               borderRadius: BorderRadius.all(Radius.circular(20)),
//                             ),

//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 color: Colors.blueGrey,
//                                 width: 2),
//                               borderRadius: BorderRadius.all(Radius.circular(20)),
//                             ),

//                           ),
//                           maxLength: 18,
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),

//             //!\\\ (КОНЕЦ) ///\\\ ПОЛЕ ДЛЯ ВВОДА НОМЕРА + ТЕКСТ ///\\\
            
//             //---------------------------------------------------------------------------------------------------------------------------------------\\

//             ///\\\ (НАЧАЛО) ///\\\ КНОПКА "ПРОДОЛЖИТЬ" ///\\\

//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: buttonWidth,
//                         height: buttonHeight,
                        
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color.fromARGB(70, 0, 0, 0),
//                               blurRadius: 25,
//                               offset: Offset(0.0, 10.0)),
//                           ],
//                         ),

//                         child: Opacity(
//                           opacity: 0.9,
//                           child: ElevatedButton(
//                           onPressed:() async {

//                             // В переменной > field_phone_number < хранится то, что ввел пользователь

//                             var prefs = await SharedPreferences.getInstance();
//                             prefs.setString('phone_number', field_phone_number);

//                             await Navigator.pushNamed(context, '/auth_get_verification_code');
//                           }, 
//                             style: ButtonStyle(
//                               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(16),
//                                 ),
//                               ),
//                             backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6F2EAE))
//                             ),

//                             child:
//                             AutoSizeText(
//                                 'Продолжить',
//                                 style: TextStyle(
//                                   fontSize: fontSizeButton,
//                                   fontFamily: "assets/fonts/Inter-Regular.ttf",
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: width * 0.25,
//                       )
//                     ],
//                   )
//                 ],
//               )
//             ),
//             //!\\\ (КОНЕЦ) ///\\\ КНОПКА "ПРОДОЛЖИТЬ" ///\\\

//           ]
//         ),
//       ),
//     );
//   }
// }