import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';
import 'package:validators/sanitizers.dart';
import 'package:vkurse_app/data/api_account_data.dart';

// Класс для отображения страницы ввода username

class ProfileFilling extends StatefulWidget {

  const ProfileFilling({Key? key}) : super(key: key);
  
  @override
  State<ProfileFilling> createState() => _ProfileFilling();

}

class _ProfileFilling extends State<ProfileFilling> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  static const countries_list = [
    "Rostov-on-Don",
    "Krasnodar",
    "Есентуки",
    "Жирнов",
    "Батайск"
  ];

  bool isDateSelected = false;

  DateTime dateTime = DateTime(DateTime.now().year - 20); // ЗДЕСЬ ХРАНИТСЯ ДАТА

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width;


    final day = DateFormat('dd').format(dateTime);
    final month = DateFormat('MMMM', 'ru_RU').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);


    var borderStyle = const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x0F000000),
                  width: 2),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              );

    var buttonStyle = ButtonStyle(
        side: MaterialStateProperty.all(BorderSide(
                            color: Color(0x0F000000),
                            width: 2),
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

            ///\\\ (НАЧАЛО) ///\\\ ШАПКА ПРОФИЛЯ ///\\\
            
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: width,
                    // width: width * 0.74,
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
                          flex: 1,
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
                          flex: 2,
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
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),

                                  decoration: InputDecoration(
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
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Form(
                                key: _formKey,
                                child: Container(
                                  width: width * 0.74,
                                  height: width * 0.14,
                                  decoration: BoxDecoration(
                                    // color: Colors.amber,
                                    color: Color(0xFFE0E3E7),
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    border: Border.all(
                                      color: Color(0x0F000000),
                                      width: 2),
                                  ),
                                  child: Container(
                                    width: width * 0.6,
                                    height: width * 0.14,
                                    // color: Colors.amberAccent,
                                    child: TypeAheadFormField(
                                    suggestionsCallback: (pattern) => countries_list.where(
                                      (item) => item.toLowerCase().contains(pattern.toLowerCase())
                                    ),
                                    itemBuilder: (_, String item) => ListTile(title: Text(item)),
                                    onSuggestionSelected: (String val) {
                                      
                                      this.controller.text = val;
                                      print(val);
                                    },
                                    getImmediateSuggestions: true,
                                    hideSuggestionsOnKeyboardHide: false,
                                    hideOnEmpty: false,
                                    noItemsFoundBuilder: (context) => Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child: Text("Город не найден",
                                      //style:
                                      ),
                                    ),
                                    textFieldConfiguration: TextFieldConfiguration(
                                      textAlign: TextAlign.start,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      style: TextStyle(
                                        
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 15),
                                        border: InputBorder.none,
                                        hintText: 'Введите название города',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      controller: this.controller,
                                    ),
                                    ),
                                  )
                                )
                              ),
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
                                    // Padding(padding: EdgeInsets.only(left: width * 0.02)),
                                        
                                      Container(
                                        padding: EdgeInsets.only(right: width * 0.02),
                                        width: width * 0.20,
                                        height: width * 0.14,
                                        child: OutlinedButton(
                                          style: buttonStyle,
                                        onPressed: () {
                                          Utils.showSheet(
                                            context,
                                            child: buildDatePicker(),
                                            onClicked: () {
                                              Navigator.pop(context);
                                            }
                                          );
                                        },

                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(isDateSelected? day : '01',
                                                style: TextStyle(
                                                  fontSize: 20,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: width * 0.35,
                                      height: width * 0.14,
                                      padding: EdgeInsets.only(right: width * 0.02),
                                      child: OutlinedButton(
                                          style: buttonStyle,
                                        onPressed: () {
                                          Utils.showSheet(
                                            context,
                                            child: buildDatePicker(),
                                            onClicked: () {
                                              setState(() => isDateSelected = true);
                                              Navigator.pop(context);
                                              print(isDateSelected);
                                            }
                                          );
                                        },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(isDateSelected?  month : 'Январь',
                                                style: TextStyle(
                                                  fontSize: 20,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.25,
                                      height: width * 0.14,
                                      padding: EdgeInsets.only(right: width * 0.05),
                                      child: OutlinedButton(
                                          style: buttonStyle,
                                        onPressed: () {
                                          Utils.showSheet(
                                            context,
                                            child: buildDatePicker(),
                                            onClicked: () {
                                              setState(() => isDateSelected = true);
                                              Navigator.pop(context);
                                            }
                                          );
                                        },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(isDateSelected? year : '1999',
                                                style: TextStyle(
                                                  fontSize: 20,
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
                        width: width * 0.65,
                        height: width * 0.13,

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
                          onPressed: (){},
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
                                  fontSize: 20,
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

  Widget buildDatePicker() => SizedBox(
        height: 180,
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

    Widget buildCountryPicker() => Form(
      key: _formKey,
      child: Container(
        // color: Colors.amber,
        height: 600,
        child: TypeAheadFormField(
          suggestionsCallback: (pattern) => countries_list.where(
            (item) => item.toLowerCase().contains(pattern.toLowerCase())
          ),
          itemBuilder: (_, String item) => ListTile(title: Text(item)),
          onSuggestionSelected: (String val) {
            this.controller.text = val;
            print(val);
          },
          getImmediateSuggestions: true,
          hideSuggestionsOnKeyboardHide: false,
          hideOnEmpty: false,
          noItemsFoundBuilder: (context) => Padding(
            padding: EdgeInsets.all(1.0),
            child: Text("Город не найден"),
          ),
          textFieldConfiguration: TextFieldConfiguration(
            decoration: InputDecoration(
              hintText: 'Введите название Вашего города',
            ),
            controller: this.controller,
          ),
        ),
      )
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