
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
// import 'package:validators/sanitizers.dart';
import 'package:vkurse_app/data/api_account_data.dart';
import 'package:vkurse_app/data/api_city_selection.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Класс для отображения страницы ввода username

class ProfileFilling extends StatefulWidget {

  const ProfileFilling({Key? key}) : super(key: key);
  
  @override
  State<ProfileFilling> createState() => _ProfileFilling();

}

class _ProfileFilling extends State<ProfileFilling> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  
  static const countriesList = [
    "Азов",
    "Ростов-на-Дону",
    "Батайск",
    "Новошахтинск",
    "Шахты",
    "Краснодар",
  ];

  bool isDateSelected = false;
  bool isNameChoosen = false;

  @override
  void initState(){
    super.initState();

    controllerName = TextEditingController();
    controllerName.addListener(() {
      isNameChoosen = controllerName.text.isNotEmpty;

      setState(() => this.controllerName = controllerName);

    });
  }

  @override
  void dispose(){
    controllerName.dispose();

    super.dispose();
  }

  DateTime dateTime = DateTime(DateTime.now().year - 20); // ЗДЕСЬ ХРАНИТСЯ ДАТА (dateTime)

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
  
    var width = mediaQuery.size.width;
    var buttonWidth = width * 0.65;
    var buttonHeight = buttonWidth * 0.20;

    double fontSizeButton = 16.0;
    double fontSizeText = 20.0;
    double fontSizeErrorText = 20.0;

    String nameOfUser = "";
    var choosenCity = "";

    final day = DateFormat('dd').format(dateTime);
    final month = DateFormat('MMMM', 'ru_RU').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);

    if (width <= 300) 
    {
        fontSizeText = 12.0;
    }

    else if (width > 300 && width <= 400) 
    {
        fontSizeText = 16.0;
        fontSizeErrorText = 10.0;
        fontSizeButton = 16.0;
    }
    else if (width > 400 && width <= 700) 
    {
        fontSizeText = 20.0;
        fontSizeErrorText = 15.0;
        fontSizeButton = 20.0;
    }
    else if (width > 700 && width <= 1000) 
    {
        fontSizeText = 30.0;
        fontSizeErrorText = 23.0;
        fontSizeButton = 30.0;
    }
    else if (width > 1000) 
    {
        fontSizeText = 35.0;
        fontSizeErrorText = 25.0;
        fontSizeButton = 35.0;
    }

    var borderStyle = OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x0F000000),
                  width: 2),
                borderRadius: BorderRadius.all(Radius.circular(width * 0.039)),
              );

    var buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFE0E3E7)),  
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(width * 0.039),
                              ),
                            ),
        side: MaterialStateProperty.all(const BorderSide(
                            color: Color(0x0F000000),
                            width: 2),
        )
      );

      var borderErrorStyle = OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(width * 0.039)),
                    );

      var textErrorStyle = TextStyle(
                            color: Colors.redAccent,
                            fontSize: fontSizeErrorText,
                            fontWeight: FontWeight.bold
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: width,
                    height: width * 0.26,
                    decoration: const BoxDecoration(
                      color: Color(0xF06F2EAE),
                      // borderRadius: BorderRadius.all(Radius.circular(16)),
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
                                  backgroundImage: AssetImage("assets/images/user_prof_pic.jpg"),
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
                                child: AutoSizeText("Настройка профиля", 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
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
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(padding: EdgeInsets.only(left: width * 0.1)),
                              SizedBox(
                                width: width * 0.25,
                                height: width * 0.06,
                                child: const AutoSizeText("Ваше имя", 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width * 0.8,
                                height: width * 0.14,
                                child: TextField(
                                  controller: controllerName,
                                  onChanged: (name){

                                    this.setState(() => nameOfUser = this.controllerName.text);
                                  },
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: fontSizeText,
                                    fontWeight: FontWeight.bold
                                  ),

                                  decoration: InputDecoration(
                                    enabledBorder: borderStyle,
                                    focusedBorder: borderStyle,

                                    hintText: "Введите Ваше имя",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: fontSizeText,
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
      
      
            ///\\\ (НАЧАЛО) ///\\\ ТЕКСТ + ФОРМА (Город) ///\\\
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
                              Padding(padding: EdgeInsets.only(left: width * 0.1)),
                              SizedBox(
                                width: width * 0.49,
                                height: width * 0.06,
                                child: const AutoSizeText(
                                  "Город проживания", 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [   
                               Container(
                                  width: width * 0.8,
                                  height: width * 0.14,

                                  child: Form(
                                  key: _formKey,
                                  child: TypeAheadFormField(

                                    // suggestionsCallback: (pattern) async {
                                    //   Completer<List> completer = new Completer();
                                    //   completer.complete(await CitySelectionApi.get_names_city());
                                    //   return completer.future;
                                    // },

                                    suggestionsCallback: (pattern) => countriesList.where(
                                      (item) => item.toLowerCase().contains(pattern.toLowerCase())
                                    ),

                                    itemBuilder: (_, String item) => ListTile(title: Text(item)),


                                    // itemBuilder: (context, suggestion){
                                    //   return ListTile(
                                    //     title: Text(suggestion)
                                    //   );
                                    // },

                                    onSuggestionSelected: (String val) {
                                      this.controllerCity.text = val; // ЗДЕСЬ ХРАНИТСЯ ГОРОД (val)
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
                                        )
                                      ),
                                    ),
                                    
                                    textFieldConfiguration: TextFieldConfiguration(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: fontSizeText,
                                        fontWeight: FontWeight.bold
                                      ),
                                      decoration: InputDecoration(
                                        enabledBorder: borderStyle,
                                        focusedBorder: borderStyle,
                                        errorBorder: borderErrorStyle,
                                        errorStyle: textErrorStyle,

                                        hintText: "Введите название города",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: fontSizeText,
                                          fontWeight: FontWeight.bold
                                        ),

                                        filled: true,
                                        fillColor: Color(0xFFE0E3E7),
                                      ),
                                      controller: this.controllerCity,
                                    ),
                                  ),
                                )
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
                              Padding(padding: EdgeInsets.only(left: width * 0.1)),
                              SizedBox(
                                width: width * 0.4,
                                height: width * 0.06,
                                child: const AutoSizeText(
                                  "Дата рождения", 
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
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
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                      SizedBox(
                                        width: width * 0.17,
                                        height: width * 0.13,
                                        child: OutlinedButton(
                                          style: buttonStyle,
                                        onPressed: () {
                                          Utils.showSheet(
                                            context,
                                            child: buildDatePicker(width),
                                            onClicked: () {
                                              Navigator.pop(context);
                                            }
                                          );
                                        },

                                          child: Row(
                                            children: [
                                              Text(isDateSelected? day : '01',
                                                style: TextStyle(
                                                  fontSize: fontSizeText,
                                                  fontWeight: FontWeight.bold,
                                                  color: isDateSelected? Colors.black : Colors.grey,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 6,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: width * 0.4,
                                      height: width * 0.13,
                                      child: OutlinedButton(
                                          style: buttonStyle,
                                        onPressed: () {
                                          Utils.showSheet(
                                            context,
                                            child: buildDatePicker(width),
                                            onClicked: () {
                                              Navigator.pop(context);
                                            }
                                          );
                                        },
                                          child: Row(
                                            children: [
                                              Text(isDateSelected? month : 'Январь',
                                                style: TextStyle(
                                                  fontSize: fontSizeText,
                                                  fontWeight: FontWeight.bold,
                                                  color: isDateSelected? Colors.black : Colors.grey,
                                                )
                                              ),
                                            ],
                                          ),
                                        )
                                    )
                                  ],
                                  
                                ),
                              ),

                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.23,
                                      height: width * 0.13,
                                      child: OutlinedButton(
                                        style: buttonStyle,
                                        onPressed: () {
                                          Utils.showSheet(
                                            context,
                                            child: buildDatePicker(width),
                                            onClicked: () {
                                              Navigator.pop(context);
                                            }
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Text(isDateSelected? year : '1999',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: fontSizeText,
                                                fontWeight: FontWeight.bold,
                                                color: isDateSelected? Colors.black : Colors.grey,
                                              )
                                            ),
                                          ],
                                        ),
                                      )
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

            ///\\\ (НАЧАЛО) ///\\\ КНОПКА ///\\\

            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: width * 0.1)),
                      Container(
                        width: buttonWidth,
                        height: buttonHeight,
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
                          onPressed: isNameChoosen && (_formKey.currentState!.validate()) && isDateSelected? () async {
                            var prefs = await SharedPreferences.getInstance();
                            var user_id = prefs.getString('user_id');
                            var username = prefs.getString('username');
                            var first_name = nameOfUser;
                            var city = this.controllerCity.text;
                            var d_birth = "$dateTime";

                            AccountDataApi.save_filling_profile(context, user_id, username, first_name, city, d_birth);
                          } : null,

                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(width * 0.039),
                                ),
                              ),
                            backgroundColor: isNameChoosen && (_formKey.currentState!.validate()) && isDateSelected? 
                            MaterialStateProperty.all<Color>(Color(0xFF6F2EAE)) : MaterialStateProperty.all<Color>(Color(0xFFA0A0A0))
                            ),

                            child: AutoSizeText(
                                'Продолжить',
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
            )

            //!\\\ (КОНЕЦ) ///\\\ КНОПКА ///\\\

          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(width) => SizedBox(
        height: width * 0.46,
        child: CupertinoDatePicker(
          minimumYear: 1970,
          maximumYear: DateTime.now().year - 14,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime){
              setState(() => this.dateTime = dateTime);
              setState(() => isDateSelected = true);
          }
        ),
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