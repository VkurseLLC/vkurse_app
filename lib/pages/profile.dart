import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:validators/sanitizers.dart';
import 'package:vkurse_app/data/api_account_data.dart';

// Класс для отображения страницы ввода username

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _Profile();
}

double fontSizeButton = 16.0;
double fontSizeText = 20.0;
double fontSizeMiniText = 15.0;
double fontSizeErrorText = 20.0;

class _Profile extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  var borderStyle = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  var borderErrorStyle = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );

  var textErrorStyle = TextStyle(
    color: Colors.redAccent,
    fontSize: fontSizeErrorText,
    fontWeight: FontWeight.bold,
    fontFamily: "assets/fonts/Inter-Regular.ttf",
  );

  var textRegStyle = const TextStyle(
    color: Color(0xFF6F2EAE),
    fontSize: 50,
    fontWeight: FontWeight.bold,
    fontFamily: "assets/fonts/Inter-Regular.ttf",
  );

  var textProfileStyle = const TextStyle(
    color: Color(0xff4D4D4D),
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: "assets/fonts/Inter-Regular.ttf",
  );

  var textMarkStyle = TextStyle(
    color: Color.fromARGB(100, 0, 0, 0),
    fontSize: fontSizeErrorText,
    fontWeight: FontWeight.bold,
    fontFamily: "assets/fonts/Inter-Regular.ttf",
  );

  bool isDateSelected = false;

  DateTime dateTime = DateTime(DateTime.now().year - 20); // ЗДЕСЬ ХРАНИТСЯ ДАТА

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    final day = DateFormat('dd').format(dateTime);
    final month = DateFormat('MMMM', 'ru_RU').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);

    var borderStyle = const OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x0F000000), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );

    var buttonStyle = ButtonStyle(
      side: MaterialStateProperty.all(
        BorderSide(color: Color(0x0F000000), width: 2),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE0E3E7)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              height: height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: width,
                    height: height * 0.5189,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/profilephoto.jpg"),
                    )),
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            width: width * 0.0526,
                            height: height * 0.054,
                            margin: EdgeInsets.fromLTRB(
                                width * 0.024, height * 0.023, 0, 0),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_ios_new),
                              iconSize: height * 0.08,
                              color: Color(0xFFffffff),
                            ),
                          ),
                          Container(
                              width: width * 0.1282,
                              height: height * 0.0614,
                              margin: EdgeInsets.fromLTRB(width * 0.7,
                                  height * 0.023, width * 0.094, 0),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Color(0x26A0A0A0),
                                  blurRadius: 20,
                                )
                              ]),
                              child: IconButton(
                                onPressed: () {
                                  /////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////НАЧАЛО\\\\\

                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          contentPadding:
                                              EdgeInsets.all(width * 0.0564),
                                          insetPadding: EdgeInsets.fromLTRB(
                                              width * 0.2358,
                                              height * 0.1338,
                                              width * 0.0564,
                                              height * 0.2738),
                                          content: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(90),
                                              color: Colors.white,
                                            ),
                                            width: width * 0.7077,
                                            height: width * 0.7523,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                /////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НАСТРОЙКИ\\\\////НАЧАЛО\\\\

                                                Container(
                                                  height: width * 0.146,
                                                  width: width * 0.7077,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                      foregroundColor:
                                                          Colors.black54,
                                                      shadowColor:
                                                          Colors.transparent,
                                                      elevation: 0.0,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/settings.png',
                                                          height: width * 0.064,
                                                          width: width * 0.064,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: width *
                                                                        0.031)),
                                                        Container(
                                                          width: width * 0.2462,
                                                          height:
                                                              width * 0.0564,
                                                          child: AutoSizeText(
                                                            "Настройки",
                                                            style: TextStyle(
                                                                fontSize: 100,
                                                                fontFamily:
                                                                    "assets/fonts/Inter-Regular.ttf",
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                /////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НАСТРОЙКИ\\\\////КОНЕЦ\\\\

                                                Container(
                                                  height: width * 0.002,
                                                  width: width * 0.7177,
                                                  color: Colors.grey.shade400,
                                                ),

                                                ////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ВАШИ ДЕЙСТВИЯ\\\\////НАЧАЛО\\\\

                                                Container(
                                                  height: width * 0.146,
                                                  width: width * 0.7077,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                      foregroundColor:
                                                          Colors.black54,
                                                      shadowColor:
                                                          Colors.transparent,
                                                      elevation: 0.0,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/last-moove.png',
                                                          height: width * 0.064,
                                                          width: width * 0.064,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: width *
                                                                        0.031)),
                                                        Container(
                                                          width: width * 0.3462,
                                                          height:
                                                              width * 0.0564,
                                                          child: AutoSizeText(
                                                            "Ваши действия",
                                                            style: TextStyle(
                                                                fontSize: 100,
                                                                fontFamily:
                                                                    "assets/fonts/Inter-Regular.ttf",
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                ////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ВАШИ ДЕЙСТВИЯ\\\\////КОНЕЦ\\\\

                                                Container(
                                                  height: width * 0.002,
                                                  width: width * 0.7177,
                                                  color: Colors.grey.shade400,
                                                ),

                                                ///////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///QR-КОД\\\\////НАЧАЛО\\\\

                                                Container(
                                                  height: width * 0.146,
                                                  width: width * 0.7077,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                      foregroundColor:
                                                          Colors.black54,
                                                      shadowColor:
                                                          Colors.transparent,
                                                      elevation: 0.0,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/qr-code.png',
                                                          height: width * 0.064,
                                                          width: width * 0.064,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: width *
                                                                        0.031)),
                                                        Container(
                                                          width: width * 0.2462,
                                                          height:
                                                              width * 0.0564,
                                                          child: AutoSizeText(
                                                            "QR-код",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "assets/fonts/Inter-Regular.ttf",
                                                                fontSize: 100,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                ///////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///QR-КОД\\\\////КОНЕЦ\\\\

                                                Container(
                                                  height: width * 0.002,
                                                  width: width * 0.7177,
                                                  color: Colors.grey.shade400,
                                                ),

                                                //////////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ИЗБРАННОЕ\\\\////НАЧАЛО\\\\

                                                Container(
                                                  height: width * 0.146,
                                                  width: width * 0.7077,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                      foregroundColor:
                                                          Colors.black54,
                                                      shadowColor:
                                                          Colors.transparent,
                                                      elevation: 0.0,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/favorite.png',
                                                          height: width * 0.064,
                                                          width: width * 0.064,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: width *
                                                                        0.031)),
                                                        Container(
                                                          width: width * 0.2462,
                                                          height:
                                                              width * 0.0564,
                                                          child: AutoSizeText(
                                                            "Избранное",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "assets/fonts/Inter-Regular.ttf",
                                                                fontSize: 100,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  height: width * 0.002,
                                                  width: width * 0.7177,
                                                  color: Colors.grey.shade400,
                                                ),

                                                ///////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ИЗБРАННОЕ\\\\////КОНЕЦ\\\\

                                                //////////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НЕВИДИМКА\\\\////НАЧАЛО\\\\

                                                Container(
                                                  height: width * 0.146,
                                                  width: width * 0.7077,
                                                  child: ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                      foregroundColor:
                                                          Colors.black54,
                                                      shadowColor:
                                                          Colors.transparent,
                                                      elevation: 0.0,
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/incognito.png',
                                                          height: width * 0.064,
                                                          width: width * 0.064,
                                                        ),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: width *
                                                                        0.031)),
                                                        Container(
                                                          width: width * 0.2462,
                                                          height:
                                                              width * 0.0564,
                                                          child: AutoSizeText(
                                                            "Невидимка",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "assets/fonts/Inter-Regular.ttf",
                                                                fontSize: 100,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                ///////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НЕВИДИМКА\\\\////КОНЕЦ\\\\

                                                ////////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КОНЕЦ\\\\
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                icon: const Icon(Icons.menu),
                                iconSize: height * 0.095,
                                color: Color(0xFFffffff),
                              ))
                        ],
                      ),
                    ]),
                  ),
                  Positioned(
                    top: height * 0.4538,
                    child: Container(
                      width: width,
                      height: height * 0.5557,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: (Radius.circular(32))),
                          border: Border.all(
                            width: 1,
                            color: Color(0x707C7C7C),
                          )),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ///ИМЯ ФАМИЛИЯ\\\///НАЧАЛО\\\

                              Container(
                                width: width * 0.756,
                                height: height * 0.0995,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.074, height * 0.031, 0, 0),
                                child: AutoSizeText(
                                  "Никита\nФомичев",
                                  style: TextStyle(
                                    color: Color(0xff4D4D4D),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Bold.ttf",
                                  ),
                                ),
                              ),

                              ///ИМЯ ФАМИЛИЯ\\\///КОНЕЦ\\\

                              ///КНОПКА РЕДАКТИРОВАНИЯ\\\///НАЧАЛО\\\

                              Container(
                                width: width * 0.063,
                                height: width * 0.063,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.010, 0, width * 0.070, 0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Color(0x954D4D4D),
                                    size: width * 0.063,
                                  ),
                                ),
                              )

                              ///КНОПКА РЕДАКТИРОВАНИЯ\\\///КОНЕЦ\\\
                            ],
                          ),

                          ///Возраст&Город\\\///НАЧАЛО\\\
                          Row(
                            children: [
                              Container(
                                width: width * 0.17,
                                height: height * 0.024,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.074, height * 0.017, 0, 0),
                                child: AutoSizeText(
                                  'Возраст',
                                  style: TextStyle(
                                    color: Color(0x50000000),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Medium.ttf",
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.17,
                                height: height * 0.024,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.259, height * 0.017, 0, 0),
                                child: AutoSizeText(
                                  'Город',
                                  style: TextStyle(
                                    color: Color(0x50000000),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Medium.ttf",
                                  ),
                                ),
                              ),
                            ],
                          ),

                          ///Возраст&Город\\\///КОНЕЦ\\\

                          ///Возраст&Город\\\///ПОЛЬЗОВАТЕЛЬ\\\///НАЧАЛО\\\

                          Row(
                            children: [
                              Container(
                                width: width * 0.162,
                                height: height * 0.0294,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.074, height * 0.0086, 0, 0),
                                child: AutoSizeText(
                                  '18 лет',
                                  style: TextStyle(
                                    color: Color(0xff4D4D4D),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Bold.ttf",
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.423,
                                height: height * 0.0294,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.2641, height * 0.0086, 0, 0),
                                child: AutoSizeText(
                                  'Ростов-на-Дону',
                                  style: TextStyle(
                                    color: Color(0xff4D4D4D),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Bold.ttf",
                                  ),
                                ),
                              ),
                            ],
                          ),

                          ///Возраст&Город\\\///ПОЛЬЗОВАТЕЛЬ\\\///КОНЕЦ\\\

                          Row(
                            children: [
                              Container(
                                width: width * 0.21,
                                height: height * 0.0233,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.074, height * 0.0282, 0, 0),
                                child: AutoSizeText(
                                  'Контакты',
                                  style: TextStyle(
                                    color: Color(0x50000000),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Medium.ttf",
                                  ),
                                ),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                width: width * 0.485,
                                height: height * 0.0294,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.074, height * 0.0086, 0, 0),
                                child: AutoSizeText(
                                  '+7-999-999-99-99',
                                  style: TextStyle(
                                    color: Color(0x80000000),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Medium.ttf",
                                  ),
                                ),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                width: width * 0.851,
                                height: height * 0.0294,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.074, height * 0.0086, 0, 0),
                                child: AutoSizeText(
                                  '@Kratos0506',
                                  style: TextStyle(
                                    color: Color(0x80000000),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Medium.ttf",
                                  ),
                                ),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                width: width * 0.21,
                                height: height * 0.0233,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.074, height * 0.0282, 0, 0),
                                child: AutoSizeText(
                                  'Описание',
                                  style: TextStyle(
                                    color: Color(0x50000000),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Medium.ttf",
                                  ),
                                ),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                width: width * 0.848,
                                height: height * 0.0884,
                                margin: EdgeInsets.fromLTRB(
                                    width * 0.074, height * 0.0172, 0, 0),
                                child: AutoSizeText(
                                  'Всем привет) Меня зовут Никита и я пользуюсь VKURSE;)\nчитать дальше...',
                                  style: TextStyle(
                                    color: Color(0x90000000),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "assets/fonts/Inter-Medium.ttf",
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
