import 'package:e_commerece_getx_flutter_app/utils/colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomRaisedButton extends StatelessWidget {
  final String title;
  final Function function;

  const CustomRaisedButton({Key key, this.title, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
        color: mainColor,
        onPressed: function,
        child: CustomText(title: title, color: whiteColor, fontSize: 16, alignment: Alignment.center,),
      ),
    );
  }
}
