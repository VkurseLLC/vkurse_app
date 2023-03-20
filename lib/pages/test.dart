import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
// import 'package:vkurse_app/pages/auth_get_verification_code.dart';
import '../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_package/src/utils/phone_number.dart';
import '../custom_package/src/utils/selector_config.dart';
import '../custom_package/src/widgets/input_widget.dart';

// Класс для отображения страницы перехода к боту

class Test extends StatefulWidget {

  const Test({Key? key}) : super(key: key);
  
  @override
  State<Test> createState() => _Test();

}

class _Test extends State<Test> {

  bool isButtonActive = false;
  // late TextEditingController controller;
  // late String field_phone_number;

  // late int _PhoneNumberLength = 10;

  // String initialCountry = 'RU';
  // PhoneNumber number = PhoneNumber(isoCode: 'RU');

  // @override
  // void initState() {
  //   super.initState();

  //   controller = TextEditingController();
  //   controller.addListener(() {
      
  //   });
  // }


  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
          children: [

             ///\\\ (НАЧАЛО) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
            // Padding(padding: EdgeInsets.fromLTRB(0, width * 0.05, 0, 0)),


            Container(
              width: width,
              height: width * 0.4581,
              child: Stack(
              children: [
                // Padding(padding: EdgeInsets.fromLTRB(width * 0.05, 0, 0, 0)),

                Positioned(
                  top: 0.0,
                  child: Container(
                    width: width,
                    child: Image.asset("assets/images/header.png"),
                  )
                ),

                Positioned(
                  child: Container(
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
                      onPressed: () {}, 
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: width * 0.1,
                      color: Color(0xFFA8A8A8),
                    )
                  )
                ),

                Positioned(
                  left: width * 0.325,
                  child: Container(
                    height: width * 0.35,
                    width: width * 0.35,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/logo_pic.png"),
                      opacity: 0.4,
                      )
                    ),
                  )   
                ),
                
                // Padding(padding: EdgeInsets.fromLTRB(0, 0, width * 0.2 + width * 0.05, 0)),
                
              ],
            ),
            ),

             //!\\\ (КОНЕЦ) ///\\\ ИКОНКА "НАЗАД" + ЛОГО ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ЛОГО ///\\\

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: AutoSizeText(
                          "Введите номер телефона",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 20, 
                            fontFamily: "assets/fonts/Inter-Bold.ttf",
                            ),
                          textAlign: TextAlign.center,
                        ),),

                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, width * 0.02)),
                      
                      ////////// ПОЛЕ ВВОДА НОМЕРА ТЕЛЕФОНА ////////// 
                      Container(

                        width: width * 0.75,
                        height: (width * 0.7) * 0.23,

                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 15),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.0488),
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
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                textStyle: TextStyle(fontSize: 18,),                               
                                onInputChanged: (PhoneNumber number) {
                                  // print(number.phoneNumber);
                                  // field_phone_number = "${number.phoneNumber}";
                                },
                                
                                onInputValidated: (bool value) {
                                    print(value);
                                },

                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                ),

                                locale: "ru",
                                countries: ["RU", "UA", "KZ", "BY"],
                                // initialValue: number,
                                ignoreBlank: false,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle: TextStyle(color: Colors.black),
                                // textFieldController: controller,
                                formatInput: false,
                                // maxLength: _PhoneNumberLength,
                                keyboardType:TextInputType.numberWithOptions(signed: true, decimal: true),
                                cursorColor: Colors.black,
                                
                                inputDecoration: InputDecoration(                                
                                  // contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                                  border: InputBorder.none,
                                  hintText: '(999) 999-99-99',
                                  hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 18),
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
                      )
                    ],
                  )
                ],
              ),
            ),

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
                        width: 288,
                        height: 55,
                        
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
                          onPressed:() {

                            // В переменной > field_phone_number < хранится то, что ввел пользователь

                            // var prefs = await SharedPreferences.getInstance();
                            // prefs.setString('phone_number', field_phone_number);

                            // await Navigator.pushNamed(context, '/auth_get_verification_code');
                          }, 
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(width * 0.039),
                                ),
                              ),
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF6F2EAE))
                            ),

                            child:
                            AutoSizeText(
                                'Продолжить',
                                style: TextStyle(
                                  fontSize: 20,
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
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\
          ]
        ),
      // ),
    );
  }
}