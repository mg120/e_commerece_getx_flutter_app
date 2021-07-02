import 'package:e_commerece_getx_flutter_app/utils/colors.dart';
import 'package:e_commerece_getx_flutter_app/view/auth/register_screen.dart';
import 'package:e_commerece_getx_flutter_app/view/forget_password_screen.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_button.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_flat_button.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text_form_field.dart';
import 'package:e_commerece_getx_flutter_app/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  TextStyle style = TextStyle(fontFamily: 'Cairo', fontSize: 16.0);
  final _formKey = GlobalKey<FormState>();

  // bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
      ),
      body:  Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                // height: size.height,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 28.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: "Welcome,",
                            fontSize: 24,
                          ),
                          InkWell(
                            onTap: ()=> Get.to(RegisterScreen()),
                            child: CustomText(
                              title: "SignUp",
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      _sizedBox(width: 0, height: 6.0),
                      CustomText(
                        title: "sign in to continue,",
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      _sizedBox(width: 0, height: 60.0),
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
                      _sizedBox(width: 0, height: 20),
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
                      _sizedBox(width: 0, height: 16.0),
                      InkWell(
                          onTap: ()=> Get.to(ForgetPasswordScreen()),
                          child: CustomText(title: "Forget Password?", alignment: Alignment.topRight,)),
                      _sizedBox(width: 0, height: 16.0),
                      CustomRaisedButton(title: "Login", function: (){
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {
                          // No any error in validation
                          controller.signInWithEmailAndPassword();
                        }
                      },),
                      _sizedBox(width: 0, height: 10.0),
                      CustomText(title: "-- OR --", alignment: Alignment.center,),
                      _sizedBox(width: 0, height: 10.0),
                      CustomFlatButton(
                        imageName: "assets/images/google.png",
                        title: "Sign in with Google",
                        onPressed: () async {
                          print("google sign clicked...");
                          await controller.handleGoogleSignIn();
                        },
                      ),
                      _sizedBox(width: 0, height: 10.0),
                      CustomFlatButton(
                        imageName: "assets/images/facebook.png",
                        title: "Sign in with FaceBook",
                        onPressed: () async{
                          print("face sign clicked...");
                          await controller.handleFaceBookLogin();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _sizedBox({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
