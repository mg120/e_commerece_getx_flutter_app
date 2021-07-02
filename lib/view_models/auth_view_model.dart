import 'package:e_commerece_getx_flutter_app/utils/colors.dart';
import 'package:e_commerece_getx_flutter_app/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{

  String email, password, name;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  final facebookLogin = FacebookLogin();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User> _user = Rx<User>();

  String get user{
    return _user.value?.email; /// check if user.value equal null first then return email
  }

  Future<void> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount _googleAccount = await _googleSignIn.signIn();
      print(_googleAccount.toString());
      GoogleSignInAuthentication googleSignInAuthentication =
      await _googleAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await _auth.signInWithCredential(credential).then((user) {
        Get.offAll(HomeScreen());
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleFaceBookLogin() async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final accessToken = result.accessToken.token;
        final OAuthCredential oAuthCredential = FacebookAuthProvider.credential(accessToken);
        UserCredential _userCredential =  await _auth.signInWithCredential(oAuthCredential);
        // _sendTokenToServer(result.accessToken.token);
        // _showLoggedInUI();
        print(_userCredential.user);
        goHome();
        break;
      case FacebookLoginStatus.cancelledByUser:
      // _showCancelledMessage();
        print("login cancelled");
        break;
      case FacebookLoginStatus.error:
      // _showErrorOnUI(result.errorMessage);
        print(result.errorMessage);
        break;
    }
  }

  void signInWithEmailAndPassword() async{
    print("email: $email");
    print("password: $password");
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value){
        print(value);
        Get.snackbar("Login Success", "you loggined successfully", colorText: Colors.green, snackPosition: SnackPosition.BOTTOM);
      });
      goHome();
    } catch(e){
      print(e.message);
      Get.snackbar("Error Login Account", e.message, colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async{
    print("email: $email");
    print("password: $password");
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
        print(value);
        Get.snackbar("registered successfully", "registered successfully", colorText: blackColor, snackPosition: SnackPosition.BOTTOM);
        goHome();
      });
    } catch(e){
      print(e.message);
      Get.snackbar("Error Login Account", e.message, colorText: blackColor, snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void goHome(){
    Get.offAll(HomeScreen());
  }
}