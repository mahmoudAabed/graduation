 import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
  this.text='',
  this.fontSize=0,
  this.color=Colors.black,
  this.alignment=Alignment.topLeft});
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize,color: color,),
      ),
    );
  }
}
