import 'package:e_commerece_getx_flutter_app/model/category_model.dart';
import 'package:e_commerece_getx_flutter_app/utils/colors.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/category_item_widget.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/product_item_widget.dart';
import 'package:e_commerece_getx_flutter_app/view_models/home_view_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      init: Get.find(),
      // init: HomeViewController(),
      builder:(controller)=> Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          // to remove exception with search because of keyboard using single child scrollview
          child: controller.loadingValue.value? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 12, top: 16, right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey.shade200,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: blackColor,
                          )),
                    ),
                  ),
                  _sizedBox(width: 0, height: 28),
                  CustomText(title: "Categories", fontSize: 28, color: blackColor, alignment: Alignment.topLeft,),
                  _sizedBox(width: 0, height: 16),
                  SizedBox(
                    height: 120,
                    child: _categoriesListView(),
                  ),
                  _sizedBox(width: 0, height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(title: "Best Seller", fontSize: 20, color: blackColor, alignment: Alignment.centerLeft,),
                      GestureDetector(
                          onTap: ()=> print("SeeAll btn Clicked"),
                          child: CustomText(title: "SeeAll", fontSize: 18, color: Colors.green, alignment: Alignment.centerRight,)),
                    ],
                  ),
                  _sizedBox(width: 0, height: 16),
                  _productsListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sizedBox({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  Widget _categoriesListView(){
    return GetBuilder<HomeViewController>(
      builder:(controller) => ListView.separated(
        itemCount: controller.categoriesList.length,
        itemBuilder: (context, index) {
          return CategoryItem(categoryModel: controller.categoriesList[index],);
        },
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => _sizedBox(width: 16),
      ),
    );
  }

  Widget _productsListView(){
    return SizedBox(
      height: 245,
      child: GetBuilder<HomeViewController>(
        builder:(controller)=> ListView.separated(
          itemCount: controller.productsList.length,
          itemBuilder: (context, index) {
            return ProductItemWidget(productModel: controller.productsList[index]);
          },
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => _sizedBox(width: 16),
        ),
      ),
    );
  }
}
