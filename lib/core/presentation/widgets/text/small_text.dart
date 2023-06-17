import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
    SmallText({Key? key, required this.text, this.size, this.fontWeight, required this.color}) : super(key: key);
   double? size = 15;
  final String text;
  FontWeight? fontWeight = FontWeight.normal;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
           color: color
      ),
    );
  }
}
