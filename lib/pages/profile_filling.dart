// //?_________________________________________НАЧАЛО ИМПОРТОВ________________________________________________?\\
//_____________________________________________СИСТЕМНЫЕ________________________________________________\\

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
//_____________________________________________БИБЛИОТЕКИ________________________________________________\\

import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:shared_preferences/shared_preferences.dart';

//_____________________________________________ДРУГИЕ ФАЙЛЫ________________________________________________\\

import 'package:vkurse_app/pages/style/canvas.dart';
import 'package:vkurse_app/data/api_account_data.dart';

//!___________________________________________КОНЕЦ ИМПОРТОВ________________________________________________!\\

// Класс для отображения страницы ввода username

class ProfileFilling extends StatefulWidget {
  const ProfileFilling({Key? key}) : super(key: key);

  @override
  State<ProfileFilling> createState() => _ProfileFilling();
}

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

  DateTime dateTime = DateTime(DateTime.now().year - 20); // ЗДЕСЬ ХРАНИТСЯ ДАТА (dateTime)
  double fontSizeText = 20.0;
  double fontSizeErrorText = 20.0;

  static const countriesList = [
    "Ростов-на-Дону",
    "Азов",
    "Батайск",
    "Жирнов",
    "Краснода",
    "Сочи"
  ];

  File? image;
  final ImagePicker picker = ImagePicker();

  Future pickImage(sourse) async {
    try {
      final image = await picker.pickImage(source: sourse);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);

    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
    Navigator.pop(context);
  }


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

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;
    var height = mediaQuery.size.height;

    double fsize = 18;

    final day = DateFormat('dd').format(dateTime);
    final month = DateFormat('MMMM', 'ru_RU').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);

    var borderErrorStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(width * 0.039)),
    );

    var textErrorStyle = TextStyle(
        color: Colors.redAccent,
        fontSize: fontSizeErrorText,
        fontWeight: FontWeight.bold);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                      width: width,
                      height: height * 0.15,
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                          child: SizedBox(
                            width: width,
                            height: height * 0.2,
                            child: CustomPaint(
                              foregroundPainter: HeaderPainter(),
                            ),
                          ),
                        ),
                      ]
                    )
                  )
                ]
              ),

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
              Column(
                children: [
                Padding(padding: EdgeInsets.only(top: height * 0.064)),
              
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width * 0.3893,
                      height: width * 0.3893,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9A68C2),
                        borderRadius: BorderRadius.all(Radius.circular(90))  
                      ),
                    ),

                    Container(
                      width: width * 0.3606,
                      height: width * 0.3606,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: const BorderRadius.all(Radius.circular(90))  
                      ),
                    ),

                    buildImage(),
                  ]
                ),

                Padding(padding: EdgeInsets.only(top: height * 0.007)),
                
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                        buildLabel('Ваше имя', width * 0.252, width * 0.062),
                      ],
                    ),

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

                    Padding(padding: EdgeInsets.only(top: width * 0.0656)),

                    Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                        buildLabel('Ваша Фамилия', width * 0.388, width * 0.062),
                      ],
                    ),

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

                  Padding(padding: EdgeInsets.only(top: width * 0.0656)),

                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                          buildLabel('Город проживания', width * 0.49, width * 0.062),
                        ],
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: width * 0.033)),

                  Row(
                    children: [
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
                                    )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.039),
                                    borderSide: BorderSide(
                                      width: 0.0,
                                      color: Colors.white,
                                    )
                                  ),
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
                          )
                        ),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 0, width * 0.106, 0)),
                    ]
                  ),

                  Padding(padding: EdgeInsets.only(top: width * 0.0656)),

                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),
                          buildLabel('Дата рождения', width * 0.402, width * 0.062),
                        ],
                      ),
                    ],
                  ),

                  Padding(padding: EdgeInsets.only(top: width * 0.033)),

                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(width * 0.109, 0, 0, 0)),

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
                                  }
                                );
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
                                      )
                                    ),
                                  ],
                                ),
                              )
                            )
                          ),
                        ],
                      ),

                      SizedBox(
                        width: width * 0.345,
                        height: width * 0.141,
                        child: OutlinedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                              }
                            );
                          },
                          child: Container(
                            width: width * 0.31,
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
                                  )
                                ),
                              ],
                            ),
                          )
                        )
                      ),

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
                              }
                            );
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
                                  )
                                ),
                              ],
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: width * 0.1656)),

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
                                )
                              )
                            ],
                          )
                        ),
                      )
                    ),
                    Padding(padding: EdgeInsets.only(top: width * 0.1656)),
                  ]
                ),

                Container(
                  width: width,
                  height: height * 0,
                  color: Colors.white,
                )
              ]
            ),
          ]
        )
      )
    );
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
      }
    ),
  );

  void _showChangeDialog(BuildContext context) {

  final mediaQuery = MediaQuery.of(context);
  var width = mediaQuery.size.width;
  var height = mediaQuery.size.height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0x00FFFFFF),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        
        contentPadding: const EdgeInsets.all(0),

        insetPadding: EdgeInsets.fromLTRB(
          width * 0.1558, height * 0.2838,
          width * 0.1564, height * 0.5038
        ),

        content: Container(
          width: width * 0.7077,
          height: width * 0.79,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            color: Color(0x00FFFFFF),
          ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: width * 0.146,
                width: width * 0.7077,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _showPickOptionDialog(context);
                  },

                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    
                    backgroundColor:Colors.white,
                    foregroundColor:Colors.black54,
                    shadowColor: Colors.white,
                    elevation: 0.0,
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/gallery.png',
                        height: width * 0.064,
                        width: width * 0.064,
                      ),

                      Padding(padding: EdgeInsets.only(left: width * 0.031)),

                      SizedBox(
                        width: width * 0.3532,
                        height: width * 0.0564,
                        child: const AutoSizeText(
                          "Изменить фото",
                          style: TextStyle(
                            fontSize: 100,
                            fontFamily: "Comfortaa",
                            color: Color(0xff626262)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              
              SizedBox(
                height: width * 0.146,
                width: width * 0.7077,
                child: ElevatedButton(

                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black54,
                    shadowColor: Colors.white,
                    elevation: 0.0,
                  ),

                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/delete.png',
                        height: width * 0.064,
                        width: width * 0.064,
                      ),

                      Padding(padding: EdgeInsets.only(left: width * 0.031)),

                      SizedBox(
                        width: width * 0.308,
                        height: width * 0.0564,
                        child: const AutoSizeText(
                          "Удалить фото",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontSize: 100,
                            color: Color(0xff626262)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  );
}

void _showPickOptionDialog(BuildContext context) {

  final mediaQuery = MediaQuery.of(context);
  var width = mediaQuery.size.width;
  var dialogheight = mediaQuery.size.height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Color(0x00FFFFFF),

        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),

        contentPadding: const EdgeInsets.all(0),

        insetPadding: EdgeInsets.fromLTRB(
          width * 0.1558, dialogheight * 0.2838,
          width * 0.1564, dialogheight * 0.5038
        ),

        content: Container(
          width: width * 0.7077,
          height: width * 0.79,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          color: Color(0x00FFFFFF),
        ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.7077,
                height: width * 0.146,
                child: ElevatedButton(
                  onPressed: () => pickImage(ImageSource.gallery),

                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),

                    backgroundColor:Colors.white,
                    foregroundColor:Colors.black54,
                    shadowColor: Colors.white,
                    elevation: 0.0,
                  ),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/gallery.png',
                        height: width * 0.064,
                        width: width * 0.064,
                      ),

                      Padding(padding: EdgeInsets.only(left: width * 0.031)),

                      Container(
                        width: width * 0.4532,
                        height: width * 0.0534,
                        // color: Colors.amber,
                        child: const AutoSizeText(
                          "Bыбрать из галлереи",
                          style: TextStyle(
                            fontSize: 100,
                            fontFamily: "Comfortaa",
                            color: Color(0xff626262)),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: width * 0.7077,
                height: width * 0.146,
                child: ElevatedButton(

                  onPressed: () => pickImage(ImageSource.camera),

                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                    ),
                    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                    foregroundColor: Colors.black54,
                    shadowColor: Colors.white,
                    elevation: 0.0,
                  ),

                  child: Row(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/camera-to-take-photos.png',
                        height: width * 0.064,
                        width: width * 0.064,
                      ),

                      Padding(padding: EdgeInsets.only(left: width * 0.031)),

                      SizedBox(
                        width: width * 0.4532,
                        height: width * 0.0534,
                        child: const AutoSizeText(
                          "Сделайте фото",
                          style: TextStyle(
                            fontFamily: "Comfortaa",
                            fontSize: 100,
                            color: Color(0xff626262)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  );
}

  Widget buildImage(){

    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;

    var photo;
    image != null ? photo = FileImage(image!) 
          : photo = AssetImage("assets/images/cameraProfile.png");

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(

          image: photo,
          fit: BoxFit.cover,
          width: width * 0.3606,
          height: width * 0.3606,
          child: InkWell(
            onTap: (){
            _showChangeDialog(context);
            }
          ),
        ) ,
      )
    );
  }

  Widget buildLabel(String text, width, height){

    return SizedBox(
      width: width,
      height: height,
      child: AutoSizeText(
        text,
        style: const TextStyle(
          fontSize: 50,
          fontFamily: "Comfortaa",
          color: Color(0xFF9A68C2)),
      ),
    );
  }
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
