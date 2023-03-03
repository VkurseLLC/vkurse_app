import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DateTime dateTime = DateTime(DateTime.now().year - 20);
    bool isDateSelected = true;

    final mediaQuery = MediaQuery.of(context); 
    var width = mediaQuery.size.width;
    
    final day = DateFormat('dd').format(dateTime);
    final month = DateFormat('MM').format(dateTime);
    final year = DateFormat('yyyy').format(dateTime);
    
    return Container(
      padding: EdgeInsets.only(right: width * 0.01),
      width: width * 0.19,
      height: width * 0.14,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFE0E3E7)),  
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isDateSelected? '01' : "$day",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )
            ),
          ],
        ),
        onPressed: onClicked,
      )
    );
  }
}