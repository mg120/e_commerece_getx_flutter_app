import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerece_getx_flutter_app/model/category_model.dart';
import 'package:e_commerece_getx_flutter_app/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController{
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection("categories");

  final CollectionReference _productsCollectionRef =
  FirebaseFirestore.instance.collection("Products");

  ValueNotifier<bool> _loading = ValueNotifier(true);
  get loadingValue => _loading;

  List<CategoryModel> _categoriesList = [];
  get categoriesList => _categoriesList;

  List<ProductModel> _productsList = [];
  get productsList => _productsList;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getBestSellerProducts();
  }

  Future<void> getCategories()async{
    // _loading.value = true;
    await _categoryCollectionRef.get().then((value) {
      for(int i=0; i< value.docs.length;i++){
        _categoriesList.add(CategoryModel.fromJson(value.docs[i].data()));
        print("categoriesList: ${_categoriesList.length}");
      }
      // _loading.value = false;
    });
    update();
  }

  Future<void> getBestSellerProducts() async{
    await _productsCollectionRef.get().then((value) {
      for(int i=0; i< value.docs.length;i++){
        _productsList.add(ProductModel.fromJson(value.docs[i].data()));
        print("productsList: ${_productsList.length}");
      }
      _loading.value = false;
    });
    update();
  }
}