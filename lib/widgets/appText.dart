import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appText extends StatelessWidget {
  const appText({super.key,required this.text,required this.fontSize,required this.color, this.overflow});
 final String text;
 final double fontSize;
 final Color color;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: TextStyle(
      fontSize: fontSize,
      fontFamily: 'alexandria',
      fontWeight: FontWeight.w500,
      color: color,
    ),
    );
  }
}
