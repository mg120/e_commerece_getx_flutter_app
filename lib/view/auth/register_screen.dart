import 'package:e_commerece_getx_flutter_app/utils/colors.dart';
import 'package:e_commerece_getx_flutter_app/view/auth/login_screen.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_button.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_flat_button.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text_form_field.dart';
import 'package:e_commerece_getx_flutter_app/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  TextStyle style = TextStyle(fontFamily: 'Cairo', fontSize: 16.0);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: ()=> Get.off(LoginScreen()),
            child: Icon(Icons.arrow_back_rounded, color: blackColor,)),
      ),
      body:  Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 22.0, vertical: 36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  title: "Sign Up,",
                  fontSize: 24,
                ),
                _sizedBox(width: 0, height: 36.0),
                CustomTextFormField(
                    obscureText: false,
                    onSave: (value){
                      controller.name = value;
                    },
                    emptyText: "name is required",
                    keyboardType: TextInputType.name,
                    style: style,
                    labelText: "Name",
                    maxLines: 1,
                    enabled: true),
                _sizedBox(width: 0, height: 16),
                CustomTextFormField(
                    obscureText: false,
                    onSave: (value){
                      controller.email = value;
                    },
                    emptyText: "email is required",
                    keyboardType: TextInputType.emailAddress,
                    style: style,
                    labelText: "Email",
                    maxLines: 1,
                    enabled: true),
                _sizedBox(width: 0, height: 16),
                CustomTextFormField(
                    obscureText: true,
                    onSave: (value){
                      controller.password = value;
                    },
                    emptyText: "password is required",
                    keyboardType: TextInputType.visiblePassword,
                    style: style,
                    labelText: "Password",
                    maxLines: 1,
                    enabled: true),
                _sizedBox(width: 0, height: 28.0),
                CustomRaisedButton(title: "Register", function: (){
                  if (_formKey.currentState.validate()) {
                    // No any error in validation
                    _formKey.currentState.save();
                    controller.createAccountWithEmailAndPassword();
                  }
                },),
                _sizedBox(width: 0, height: 10.0),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }

  Widget _sizedBox({double width, double height}){
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
