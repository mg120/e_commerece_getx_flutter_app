import 'package:e_commerece_getx_flutter_app/view/auth/login_screen.dart';
import 'package:e_commerece_getx_flutter_app/view/home_screen.dart';
import 'package:e_commerece_getx_flutter_app/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get
          .find<AuthViewModel>()
          .user != null) ? HomeScreen() : LoginScreen();
    });
  }
}
