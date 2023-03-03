import 'package:flutter/material.dart';
import 'package:vkurse_app/pages/utils.dart';
import 'package:vkurse_app/pages/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:validators/sanitizers.dart';
import 'package:vkurse_app/data/api_account_data.dart';

// Класс для отображения страницы ввода username

class ProfileFilling extends StatefulWidget {

  const ProfileFilling({Key? key}) : super(key: key);
  
  @override
  State<ProfileFilling> createState() => _ProfileFilling();

}

class _ProfileFilling extends State<ProfileFilling> {

  DateTime dateTime = DateTime(DateTime.now().year - 20);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;

    var borderStyle = const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x0F000000),
                  width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              );
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [

            ///\\\ (НАЧАЛО) ///\\\ ШАПКА ПРОФИЛЯ ///\\\
            
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: width,
                    height: width * 0.26,
                    decoration: const BoxDecoration(
                      color: Color(0xF06F2EAE),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                            BoxShadow(
                              color: Color(0x33000000),
                              blurRadius: 2,
                              offset: Offset(0.0, 5.0)),
                          ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.23,
                                height: width * 0.23,
                                child: CircleAvatar(
                                  radius: width * 0.23,
                                  backgroundImage: AssetImage("assets/images/check.jpg"),
                                ),
                              )
                            ],
                          )
                        ),

                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.52,
                                height: width * 0.06,
                                child: const Text("Настройка профиля", 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              )
                            ],
                          )
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),

            //!\\\ (КОНЕЦ) ///\\\ ШАПКА ПРОФИЛЯ ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ТЕКСТ + ФОРМА (Имя) ///\\\

            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(padding: EdgeInsets.only(left: width * 0.13)),
                              SizedBox(
                                width: width * 0.25,
                                height: width * 0.06,
                                child: const Text("Ваше имя", 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              SizedBox(
                                width: width * 0.74,
                                height: width * 0.14,
                                child: TextField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  // maxLength: 4,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24
                                  ),

                                  decoration: InputDecoration(
                                    // errorText: ,
                                    // errorStyle: ,
                                    // errorBorder: ,
                                    // focusedErrorBorder: ,
                                    enabledBorder: borderStyle,
                                    focusedBorder: borderStyle,

                                    hintText: "Введите Ваше имя",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),

                                    filled: true,
                                    fillColor: Color(0xFFE0E3E7),
                                  ),
                                ),
                              )
                            ]
                          )
                        ),
                      ],
                    )
                  ),
                ],
              )
            ),

            //!\\\ (КОНЕЦ) ///\\\ ТЕКСТ + ФОРМА (Имя) ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ТЕКСТ + ФОРМА (Дата) ///\\\

            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(padding: EdgeInsets.only(left: width * 0.13)),
                              SizedBox(
                                width: width * 0.4,
                                height: width * 0.06,
                                child: const Text("Дата рождения", 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              )
                            ],
                          )
                        ),

                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // Padding(padding: EdgeInsets.only(left: width * 0.13)),
                                     ButtonWidget(
                                        onClicked: () => Utils.showSheet(
                                          context,
                                          child: buildDatePicker(),
                                          onClicked: () {
                                            final day = DateFormat('dd').format(dateTime);
                                            final month = DateFormat('MM').format(dateTime);
                                            final year = DateFormat('yyyy').format(dateTime);
                                            // Utils.showSnackBar(context, 'Selected "$value"');

                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                        
        

                                      // child: TextField(
                                      //   keyboardType: TextInputType.datetime,
                                      //   textAlign: TextAlign.center,
                                      //   textAlignVertical: TextAlignVertical.center,

                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //     fontSize: 24
                                      //   ),

                                      //   decoration: InputDecoration(
                                      //     counterText: "",
                                      //     // errorText: ,
                                      //     // errorStyle: ,
                                      //     // errorBorder: ,
                                      //     // focusedErrorBorder: ,
                                      //     enabledBorder: borderStyle,
                                      //     focusedBorder: borderStyle,

                                      //     hintText: "01",
                                      //     hintStyle: TextStyle(
                                      //       color: Colors.grey,
                                      //       fontSize: 20,
                                      //       fontWeight: FontWeight.bold
                                      //     ),

                                      //     filled: true,
                                      //     fillColor: Color(0xFFE0E3E7),
                                      //   ),
                                      //   maxLength: 2,
                                      // ),
                                  ],
                                ),
                              ),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.33,
                                      height: width * 0.14,
                                      padding: EdgeInsets.only(right: width * 0.01),
                                      child: TextField(
                                        
                                        keyboardType: TextInputType.name,
                                        textAlign: TextAlign.center,
                                        textAlignVertical: TextAlignVertical.center,

                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24
                                        ),

                                        decoration: InputDecoration(
                                          counterText: "",
                                          // errorText: "fdsf",
                                          // errorStyle: ,
                                          // errorBorder: ,
                                          // focusedErrorBorder: ,
                                          enabledBorder: borderStyle,
                                          focusedBorder: borderStyle,

                                          hintText: "Январь",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20, 
                                            fontWeight: FontWeight.bold
                                          ),

                                          filled: true,
                                          fillColor: Color(0xFFE0E3E7),
                                        ),
                                      ),
                                    )
                                  ],
                                  
                                ),
                              ),

                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.21,
                                      height: width * 0.14,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        textAlignVertical: TextAlignVertical.center,

                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24
                                        ),

                                        decoration: InputDecoration(
                                          counterText: "",
                                          // errorText: ,
                                          // errorStyle: ,
                                          // errorBorder: ,
                                          // focusedErrorBorder: ,
                                          enabledBorder: borderStyle,
                                          focusedBorder: borderStyle,

                                          hintText: "1999",
                                          hintStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),

                                          filled: true,
                                          fillColor: Color(0xFFE0E3E7),
                                        ),
                                        maxLength: 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        )            
                      ],
                    )
                  ),
                ],
              )
            ),

            //!\\\ (КОНЕЦ) ///\\\ ТЕКСТ + ФОРМА (Дата) ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ ТЕКСТ + ФОРМА (Город) ///\\\

                        Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(padding: EdgeInsets.only(left: width * 0.13)),
                              SizedBox(
                                width: width * 0.49,
                                height: width * 0.06,
                                child: const Text("Город проживания", 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              SizedBox(
                                width: width * 0.74,
                                height: width * 0.14,
                                child: TextField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,

                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24
                                  ),

                                  decoration: InputDecoration(
                                    // errorText: ,
                                    // errorStyle: ,
                                    // errorBorder: ,
                                    // focusedErrorBorder: ,
                                    enabledBorder: borderStyle,
                                    focusedBorder: borderStyle,

                                    hintText: "Выберите город",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),

                                    filled: true,
                                    fillColor: Color(0xFFE0E3E7),
                                  ),
                                ),
                              )
                            ]
                          )
                        ),
                      ],
                    )
                  ),
                ],
              )
            ),

            //!\\\ (КОНЕЦ) ///\\\ ТЕКСТ + ФОРМА (Город) ///\\\
            
            //---------------------------------------------------------------------------------------------------------------------------------------\\

            ///\\\ (НАЧАЛО) ///\\\ КНОПКА ///\\\

            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                      ],
                    )
                  )
                ],
              )
            ),

            //!\\\ (КОНЕЦ) ///\\\ КНОПКА ///\\\

          ],
        ),
      ),
    ); 
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1970,
          maximumYear: DateTime.now().year - 14,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime){
              setState(() => this.dateTime = dateTime);
          }
        ),
      );
}