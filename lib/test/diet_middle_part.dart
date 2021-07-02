import 'package:el_saha/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DietMiddlePartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(title: "Meals For Today", color: Colors.grey, fontSize: 16, alignment: Alignment.centerLeft,),
          Container(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  ...List.generate(3, (index) => Container()).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
