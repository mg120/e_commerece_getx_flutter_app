import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final TextStyle style;
  final bool enabled;
  final TextEditingController controller;
  final String emptyText;
  final TextInputType keyboardType;
  final int maxLines;
  final int maxLength;
  final String labelText;
  final String suffixText;
  final Function onSave;

  const CustomTextFormField(
      {Key key,
      this.obscureText,
      this.style,
      this.enabled,
      this.controller,
      this.emptyText,
      this.keyboardType,
      this.maxLines,
      this.maxLength,
      this.labelText,
      this.suffixText,
      this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: obscureText,
        style: style,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        onSaved: onSave,
        validator: (String val) {
          if (val.isEmpty) {
            return emptyText;
          } else if(labelText == "Email" && !val.contains("@")){
            return "Please enter a valid email";
          } else {
            return null;
          }
        },
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(13.0, 10.0, 13.0, 10.0),
          errorStyle: TextStyle(
            fontFamily: "Cairo",
            color: Colors.red,
            fontSize: 13,
          ),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 16),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
        ),
      ),
    );
  }
}
