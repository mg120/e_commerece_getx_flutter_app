import 'package:e_commerece_getx_flutter_app/view_models/home_navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeNavigationViewModel(),
      builder:(controller) => Scaffold(
        body: controller.currentView,
        bottomNavigationBar: _bottomNavigationBar(controller),
      ),
    );
  }

  Widget _bottomNavigationBar(controller) {
    return BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("Explore"),
                  ),
                  label: "",
                  icon: Image.asset("assets/images/Icon_Explore.png", fit: BoxFit.contain,)),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("Cart"),
                ),
                  label: "",
                  icon: Image.asset("assets/images/Icon_Cart.png", fit: BoxFit.contain,)),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text("Profile"),
                ),
                  label: "",
                  icon: Image.asset("assets/images/user.png", fit: BoxFit.contain, )),
            ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          currentIndex: controller.currentIndex,
          onTap: (index){
              print("index: $index");
              controller.changeSelectedIndex(index);
          },
    );
  }
}
