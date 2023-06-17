import 'package:flutter/material.dart';

class LargeText extends StatelessWidget {
  LargeText(
      {Key? key,
      required this.text,
       this.size,
        this.fontWeight})
      : super(key: key);
  double? size = 30;
  String text;
  FontWeight? fontWeight = FontWeight.bold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
