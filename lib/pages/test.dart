import 'package:vkurse_app/pages/utils.dart';
import 'package:vkurse_app/pages/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime dateTime = DateTime(DateTime.now().year - 20);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                onClicked: () => Utils.showSheet(
                  context,
                  child: buildDatePicker(),
                  onClicked: () {
                    final value = DateFormat('dd/MM/yyyy').format(dateTime);
                    Utils.showSnackBar(context, 'Selected "$value"');

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );

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