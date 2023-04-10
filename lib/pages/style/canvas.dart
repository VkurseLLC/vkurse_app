import 'package:flutter/material.dart';

class HeaderPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {

  Paint paint0 = Paint()
      ..color = Color(0xFF9A68C2)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width,0);
    path0.lineTo(size.width,size.height*0.80);
    path0.quadraticBezierTo(size.width*0.8434750,size.height*1.0186800,size.width*0.50,size.height);
    path0.quadraticBezierTo(size.width*0.1569500,size.height*1.0205600,0,size.height*0.8000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}