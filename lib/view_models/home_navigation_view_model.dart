import 'file:///G:/FlutterProjects/e_commerece_getx_flutter_app/lib/view/cart/cart_view.dart';
import 'package:e_commerece_getx_flutter_app/view/home_view.dart';
import 'package:e_commerece_getx_flutter_app/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNavigationViewModel extends GetxController{
  int _selectedIndex = 0;

  int get currentIndex => _selectedIndex;

  Widget _currentView = HomeView();

  get currentView => _currentView;

  void changeSelectedIndex(int newIndex){
    _selectedIndex = newIndex;
    print("_selectedIndex: $_selectedIndex");
    switch(newIndex){
      case 0:
        _currentView = HomeView();
        print("_currentView: $_currentView");
        break;
      case 1:
        _currentView = CartView();
        print("_currentView: $_currentView");
        break;
      case 2:
        _currentView = ProfileView();
        print("_currentView: $_currentView");
        break;
    }
    print("out now");
    update();
  }
}