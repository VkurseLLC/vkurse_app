// //?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
// //_____________________________________________СИСТЕМНЫЕ________________________________________________\\

// //_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:shared_preferences/shared_preferences.dart';

// //_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:validators/sanitizers.dart';
import 'package:vkurse_app/data/api_account_data.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:vkurse_app/pages/style/canvas.dart';
//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

// Класс для отображения страницы ввода username

class ProfileFilling extends StatefulWidget {
  const ProfileFilling({Key? key}) : super(key: key);

  @override
  State<ProfileFilling> createState() => _ProfileFilling();
}

double fontSizeButton = 16.0;
double fontSizeText = 20.0;
double fontSizeMiniText = 15.0;
double fontSizeErrorText = 20.0;

class _ProfileFilling extends State<ProfileFilling> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String surName = "";

  final TextEditingController controller = TextEditingController();
  bool isDateSelected = false;
  bool isDisabled = true;
  bool isSoNameChoosen = false;
  bool isNameChoosen = false;
  bool isDisabled1 = true;
  bool isDisabled2 = true;
  bool isDisabled3 = true;
  bool isDisabled4 = true;

  final TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerSoName = TextEditingController();

  var choosenCity = "";

  static const countriesList = [
    "Ростов-на-Дону",
    "Азов",
    "Батайск",
    "Жирнов",
    "Краснода",
    "Сочи"
  ];

  @override
  void initState() {
    super.initState();

    controllerName = TextEditingController();
    controllerName.addListener(() {
      isNameChoosen = controllerName.text.isNotEmpty;

      setState(() => this.controllerName = controllerName);
    });
    controllerSoName = TextEditingController();
    controllerSoName.addListener(() {
      isSoNameChoosen = controllerSoName.text.isNotEmpty;

      setState(() => this.controllerSoName = controllerSoName);
    });
  }

  @override
  void dispose() {
    controllerName.dispose();

    super.dispose();
  }

  DateTime dateTime =
      DateTime(DateTime.now().year - 20); // ЗДЕСЬ ХРАНИТСЯ ДАТА (dateTime)

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var textheight = mediaQuery.size.height;
    if (width > 700) {
      textheight = textheight * 3;
    }
    var height = mediaQuery.size.height;
    var dialogheight = mediaQuery.size.height;
    var proporcia = width / height;

    double fsize = 18;
    if (width > 700) {
      fsize = fsize * 2.5;
    }
    if (width > 500 && width < 700) {
      fsize = fsize * 1.5;
    }

    if (proporcia < 0.4) {
      height = height * 0.8;
    }
    if (proporcia > 0.46 && proporcia < 0.5) {
      height = height * 1.05;
    }
    if (proporcia > 0.5 && proporcia < 0.65) {
      height = height * 1.2;
    }
    if (proporcia > 0.65 && proporcia < 0.72) {
      height = height * 1.3;
    }
    if (proporcia > 0.72 && proporcia < 0.75) {
      height = height * 1.4;
    }
    if (proporcia >= 0.75) {
      height = height * 1.5;
    }

    final day = DateFormat('dd').format(dateTime);
    final month = DateFormat('MMMM', 'ru_RU').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);

    var borderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Color(0x0F000000), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(width * 0.039)),
    );

    var buttonStyle = ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFFE0E3E7)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width * 0.039),
          ),
        ),
        side: MaterialStateProperty.all(
          const BorderSide(color: Color(0x0F000000), width: 2),
        ));

    var borderErrorStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(width * 0.039)),
    );

    var textErrorStyle = TextStyle(
        color: Colors.redAccent,
        fontSize: fontSizeErrorText,
        fontWeight: FontWeight.bold);

    XFile? image;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Stack(children: <Widget>[
          Row(children: [
            SizedBox(
                width: width,
                height: height * 0.15,
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                    child: SizedBox(
                      width: width,
                      height: height * 0.15,
                      child: CustomPaint(
                        foregroundPainter: HeaderPainter(),
                      ),
                    ),
                  ),
                ]))
          ]),

          ///----------------------------------////КНОПКА\\\///НАЗАД\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

          Positioned(
            top: height * 0.045,
            left: width * 0.0745,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Color(0xFFffffff),
              iconSize: width * 0.115,
            ),
          ),

          ///----------------------------------////КНОПКА\\\///НАЗАД\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\

          Column(children: [
            Padding(padding: EdgeInsets.only(top: height * 0.064)),
            SizedBox(
              width: width * 0.348,
              height: width * 0.348,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0x00FFFFFF),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          contentPadding: EdgeInsets.all(0),
                          insetPadding: EdgeInsets.fromLTRB(
                              width * 0.1558,
                              dialogheight * 0.2838,
                              width * 0.1564,
                              dialogheight * 0.5038),
                          content: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: Color(0x00FFFFFF),
                            ),
                            width: width * 0.7077,
                            height: width * 0.79,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///ИЗМЕНИТЬ ФОТО\\\\////НАЧАЛО\\\\

                                Container(
                                  height: width * 0.146,
                                  width: width * 0.7077,
                                  child: ElevatedButton(
                                    onPressed: () async {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      backgroundColor:
                                          Color.fromRGBO(255, 255, 255, 1),
                                      foregroundColor: Colors.black54,
                                      shadowColor: Colors.white,
                                      elevation: 0.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/gallery.png',
                                          height: width * 0.064,
                                          width: width * 0.064,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.031)),
                                        Container(
                                          width: width * 0.3532,
                                          height: width * 0.0564,
                                          child: AutoSizeText(
                                            "Изменить фото",
                                            style: TextStyle(
                                                fontSize: 100,
                                                fontFamily:
                                                    "assets/fonts/Inter-Regular.ttf",
                                                color: Color(0xff626262)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                /////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НАСТРОЙКИ\\\\////КОНЕЦ\\\\

                                //////////ВСПЛЫВАЮЩЕЕ ОКНО\\\\////КНОПКА\\\\\///НЕВИДИМКА\\\\////НАЧАЛО\\\\

                                Container(
                                  height: width * 0.146,
                                  width: width * 0.7077,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight:
                                                  Radius.circular(20))),
                                      backgroundColor:
                                          Color.fromRGBO(255, 255, 255, 1),
                                      foregroundColor: Colors.black54,
                                      shadowColor: Colors.white,
                                      elevation: 0.0,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/icons/delete.png',
                                          height: width * 0.064,
                                          width: width * 0.064,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.031)),
                                        Container(
                                          width: width * 0.308,
                                          height: width * 0.0564,
                                          child: AutoSizeText(
                                            "Удалить фото",
                                            style: TextStyle(
                                                fontFamily:
                                                    "assets/fonts/Inter-Regular.ttf",
                                                fontSize: 100,
                                                color: Color(0xff626262)),
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  shape: CircleBorder(
                      side: BorderSide(width: 5, color: Colors.grey.shade200)),
                ),
                child: Image.asset(
                  'assets/images/camera-to-take-photos.png',
                  height: width * 0.203,
                  width: width * 0.203,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: height * 0.007)),
            Column(children: [
              ///----------------------------------////НАЗВАНИЕ\\\///ИМЯ\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                  Container(
                    width: width * 0.252,
                    height: width * 0.062,
                    child: AutoSizeText(
                      'Ваше имя',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Comfortaa",
                          color: Color(0xff898989)),
                    ),
                  ),
                ],
              ),

              ///----------------------------------////НАЗВАНИЕ\\\///ИМЯ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\

              Padding(padding: EdgeInsets.only(top: width * 0.033)),

              ///----------------------------------////СТРОКА ВВОДА \\\///ИМЯ\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

              Row(children: [
                Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: width * 0.141,
                      width: width * 0.738,
                      child: TextField(
                        onChanged: (String value) {
                          name = value;
                        },
                        controller: controllerName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: fsize,
                          height: height * 0.0013,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.039),
                              borderSide: BorderSide(
                                width: 0.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.039),
                              borderSide: BorderSide(
                                width: 0.0,
                                color: Colors.white,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.039),
                              borderSide: BorderSide(
                                width: 0.0,
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'Bведите имя',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: fsize,
                              fontWeight: FontWeight.w500,
                            ),
                            fillColor: Colors.grey.shade300),
                      ),
                    )),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, width * 0.106, 0)),
              ]),

              ///----------------------------------////СТРОКА ВВОДА \\\///ИМЯ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\

              Padding(padding: EdgeInsets.only(top: width * 0.0656)),

              ///----------------------------------////НАЗВАНИЕ \\\///ФАМИЛИЯ\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                  Container(
                    width: width * 0.388,
                    height: width * 0.062,
                    child: AutoSizeText(
                      'Ваша Фамилия',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Comfortaa",
                          color: Color(0xff898989)),
                    ),
                  ),
                ],
              ),

              ///----------------------------------////НАЗВАНИЕ \\\///ФАМИЛИЯ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\

              Padding(padding: EdgeInsets.only(top: width * 0.033)),

              ///----------------------------------////СТРОКА ВВОДА \\\///ФАМИЛИЯ\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

              Row(children: [
                Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                Expanded(
                    flex: 1,
                    child: Container(
                      height: width * 0.141,
                      width: width * 0.738,
                      child: TextField(
                        onChanged: (String value) {
                          surName = value;  
                        },
                        controller: controllerSoName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: fsize,
                          height: height * 0.0013,
                          color: Colors.black,
                          fontFamily: "Comfortaa",
                        ),
                        decoration: InputDecoration(
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.039),
                              borderSide: BorderSide(
                                width: 0.0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.039),
                              borderSide: BorderSide(
                                width: 0.0,
                                color: Colors.white,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.039),
                              borderSide: BorderSide(
                                width: 0.0,
                                color: Colors.white,
                              ),
                            ),
                            hintText: 'Bведите фамилию',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: fsize,
                              fontWeight: FontWeight.w500,
                            ),
                            fillColor: Colors.grey.shade300),
                      ),
                    )),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, width * 0.106, 0)),
              ]),

              ///----------------------------------////СТРОКА ВВОДА \\\///ФАМИЛИЯ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\

              Padding(padding: EdgeInsets.only(top: width * 0.0656)),

              ///----------------------------------////НАЗВАНИЕ \\\///ГОРОД ПРОЖИВАНИЯ\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                  Container(
                    width: width * 0.49,
                    height: width * 0.062,
                    child: AutoSizeText(
                      'Город проживания',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Comfortaa",
                          color: Color(0xff898989)),
                    ),
                  ),
                ],
              ),

              ///----------------------------------////НАЗВАНИЕ \\\///ГОРОД ПРОЖИВАНИЯ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\

              Padding(padding: EdgeInsets.only(top: width * 0.033)),

              ///----------------------------------////СТРОКА ВВОДА \\\///ГОРОД ПРОЖИВАНИЯ\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

              Row(children: [
                Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                Expanded(
                  flex: 1,
                  child: Container(
                      width: width * 0.682,
                      height: width * 0.141,
                      child: Form(
                        key: _formKey,
                        child: TypeAheadFormField(
                          suggestionsCallback: (pattern) => countriesList.where(
                              (item) => item
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase())),
                          itemBuilder: (_, String item) =>
                              ListTile(title: Text(item)),
                          onSuggestionSelected: (String val) {
                            this.controllerCity.text =
                                val; // ЗДЕСЬ ХРАНИТСЯ ГОРОД (val)
                            setState(() {
                              choosenCity = val;
                            });
                          },
                          getImmediateSuggestions: true,
                          hideSuggestionsOnKeyboardHide: false,
                          hideOnEmpty: false,
                          noItemsFoundBuilder: (context) => Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text("Город не найден",
                                style: TextStyle(
                                  fontSize: fontSizeText,
                                )),
                          ),
                          textFieldConfiguration: TextFieldConfiguration(
                            onSubmitted: (value) {},
                            style: TextStyle(
                              height: height * 0.0013,
                              color: Colors.black,
                              fontSize: fsize,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Comfortaa",
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.039),
                                  borderSide: BorderSide(
                                    width: 0.0,
                                    color: Colors.white,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.039),
                                  borderSide: BorderSide(
                                    width: 0.0,
                                    color: Colors.white,
                                  )),
                              disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.039),
                                borderSide: BorderSide(
                                  width: 0.0,
                                  color: Colors.white,
                                ),
                              ),
                              errorBorder: borderErrorStyle,
                              errorStyle: textErrorStyle,
                              hintText: 'Bведите город проживания',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: fsize,
                                fontWeight: FontWeight.w500,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade300,
                            ),
                            controller: this.controllerCity,
                          ),
                        ),
                      )),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, width * 0.106, 0)),
              ]),

              ///----------------------------------////СТРОКА ВВОДА \\\///ГОРОД ПРОЖИВАНИЯ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\

              Padding(padding: EdgeInsets.only(top: width * 0.0656)),

              ///----------------------------------////НАЗВАНИЕ \\\///ДАТА РОЖДЕНИЯ\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                  Container(
                    width: width * 0.402,
                    height: width * 0.062,
                    child: AutoSizeText(
                      'Дата рождения',
                      style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Comfortaa",
                          color: Color(0xff898989)),
                    ),
                  ),
                ],
              ),

              ///----------------------------------////НАЗВАНИЕ \\\///ДАТА РОЖДЕНИЯ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\

              Padding(padding: EdgeInsets.only(top: width * 0.033)),

              ///----------------------------------////СТРОКА ВВОДА \\\///ДАТА РОЖДЕНИЯ\\\\\///НАЧАЛО\\\\-------------------------------------------------------------\\\\

              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),

                  ///----------------------------------////ДЕНЬ \\\///ДАТА РОЖДЕНИЯ\\\\-------------------------------------------------------------\\\\

                  Column(
                    children: [
                      SizedBox(
                          width: width * 0.2,
                          height: width * 0.141,
                          child: OutlinedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.039),
                                  ),
                                ),
                                side: MaterialStateProperty.all(
                                  const BorderSide(
                                      color: Color(0x0F000000), width: 0),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey.shade300),
                              ),
                              onPressed: () {
                                Utils.showSheet(context,
                                    child: buildDatePicker(width),
                                    onClicked: () {
                                  Navigator.pop(context);
                                });
                              },
                              child: Container(
                                width: width * 0.15,
                                height: width * 0.072,
                                child: Row(
                                  children: [
                                    AutoSizeText(
                                        isDateSelected
                                            ? day
                                            : '01', //------------------------берет данные из массива------------\\
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 50,
                                          fontWeight: FontWeight.w500,
                                          color: isDateSelected
                                              ? Colors.black
                                              : Colors.grey,
                                          fontFamily: "Comfortaa",
                                        )),
                                  ],
                                ),
                              ))),
                    ],
                  ),

                  ///----------------------------------////МЕСЯЦ \\\///ДАТА РОЖДЕНИЯ\\\\-------------------------------------------------------------\\\\

                  SizedBox(
                      width: width * 0.345,
                      height: width * 0.141,
                      child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.039),
                              ),
                            ),
                            side: MaterialStateProperty.all(
                              const BorderSide(
                                  color: Color(0x0F000000), width: 0),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey.shade300),
                          ),
                          onPressed: () {
                            Utils.showSheet(context,
                                child: buildDatePicker(width), onClicked: () {
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            width: width * 0.315,
                            height: width * 0.073,
                            child: Row(
                              children: [
                                AutoSizeText(
                                    isDateSelected
                                        ? month
                                        : 'Январь', //------------------------берет данные из массива------------\\
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w500,
                                      color: isDateSelected
                                          ? Colors.black
                                          : Colors.grey,
                                      fontFamily: "Comfortaa",
                                    )),
                              ],
                            ),
                          ))),

                  ///----------------------------------////ГОД \\\///ДАТА РОЖДЕНИЯ\\\\-------------------------------------------------------------\\\\

                  SizedBox(
                      width: width * 0.25,
                      height: width * 0.141,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(width * 0.039),
                            ),
                          ),
                          side: MaterialStateProperty.all(
                            const BorderSide(
                                color: Color(0x0F000000), width: 0),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade300),
                        ),
                        onPressed: () {
                          Utils.showSheet(context,
                              child: buildDatePicker(width), onClicked: () {
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          width: width * 0.16,
                          height: width * 0.072,
                          child: Row(
                            children: [
                              AutoSizeText(isDateSelected ? year : '1999',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: "Comfortaa",
                                    fontSize: 50,
                                    fontWeight: FontWeight.w500,
                                    color: isDateSelected
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: width * 0.1656)),

              ///----------------------------------////СТРОКА ВВОДА \\\///ДАТА РОЖДЕНИЯ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\
              Container(
                  width: width * 0.6538,
                  height: width * 0.1333,
                  decoration: const BoxDecoration(
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
                        onPressed: isNameChoosen &&
                                isSoNameChoosen &&
                                (_formKey.currentState!.validate()) &&
                                isDateSelected
                            ? () async {
                                var prefs = await SharedPreferences.getInstance();
                                var user_id = prefs.getString('user_id');
                                var username = prefs.getString('username');
                                var city = this.controllerCity.text;
                                var d_birth = "$dateTime";
                                d_birth = d_birth[0] + d_birth[1] + d_birth[2] + d_birth[3] + d_birth[4] + d_birth[5] + d_birth[6] + d_birth[7] + d_birth[8] + d_birth[9];

                                AccountDataApi.save_filling_profile(
                                    context,
                                    user_id,
                                    username,
                                    name,
                                    surName,
                                    d_birth,
                                    city,
                                    );
                              }
                            : null,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 0.039),
                              ),
                            ),
                            backgroundColor: isNameChoosen &&
                                    isSoNameChoosen &&
                                    (_formKey.currentState!.validate()) &&
                                    isDateSelected
                                ? MaterialStateProperty.all<Color>(
                                    Color(0xFF9A68C2))
                                : MaterialStateProperty.all<Color>(
                                    Color(0xFFA0A0A0))),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(right: width * 0.157)),
                            SizedBox(
                                width: width * 0.3692,
                                height: width * 0.0564,
                                child: AutoSizeText(
                                  'Cохранить',
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: "Comfortaa",
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )),
                  )),
              Padding(padding: EdgeInsets.only(top: width * 0.1656)),

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\\
            ]),

            ///----------------------------------///////ОПИСАНИЕ\\\\\///КОНЕЦ\\\\-------------------------------------------------------------\\\\
            Container(
              width: width,
              height: height * 0,
              color: Colors.white,
            )
          ]),
        ]))));
  }

  Widget buildDatePicker(width) => SizedBox(
        height: width * 0.46,
        child: CupertinoDatePicker(
            minimumYear: 1970,
            maximumYear: DateTime.now().year - 14,
            initialDateTime: dateTime,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (dateTime) {
              setState(() => this.dateTime = dateTime);
              setState(() => isDateSelected = true);
              print(isDateSelected);
            }),
      );
}

class Utils {
  static List<Widget> modelBuilder<M>(
          List<M> models, Widget Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, Widget>(
              (index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Применить'),
            onPressed: onClicked,
          ),
        ),
      );
}
