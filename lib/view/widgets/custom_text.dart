import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final Alignment alignment;
  final int maxLines;

  const CustomText({Key key, this.title, this.color = Colors.black, this.fontSize = 16, this.alignment = Alignment.topLeft, this.maxLines}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(title, style: TextStyle(fontSize: fontSize, color: color), maxLines: maxLines ),
    );
  }
}
