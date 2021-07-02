import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Center(
        child: CustomText(title: "Forget Password", alignment: Alignment.center,),
      ),
    );
  }
}
