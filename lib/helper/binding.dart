
import 'package:e_commerece_getx_flutter_app/view_models/auth_view_model.dart';
import 'package:e_commerece_getx_flutter_app/view_models/home_navigation_view_model.dart';
import 'package:e_commerece_getx_flutter_app/view_models/home_view_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeNavigationViewModel());
    Get.lazyPut(() => HomeViewController());
  }
}