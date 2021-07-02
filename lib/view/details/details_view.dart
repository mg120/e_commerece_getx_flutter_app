import 'package:e_commerece_getx_flutter_app/model/product_model.dart';
import 'package:e_commerece_getx_flutter_app/utils/colors.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_button.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  final ProductModel productModel;

  const DetailsView({Key key, this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 76),
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      height: 240,
                      child: Image.network(productModel.image, fit: BoxFit.fill,)),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        CustomText(
                          title: productModel.name,
                          fontSize: 26,
                        ),
                        _sizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: size.width * 0.4,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(title: "Size:",),
                                  CustomText(title: productModel.size,),
                                ],
                              ),
                            ),
                            Container(
                              width: size.width * 0.4,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText(title: "Color:",),
                                  Container(
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: _colorFromHex(productModel.color),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        _sizedBox(
                          height: 14,
                        ),
                        CustomText(
                          title: "Details:",
                          fontSize: 19,
                          color: blackColor,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            title: productModel.description,
                            fontSize: 17,
                          ),
                        ),
                        _sizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child:  Container(
              color: whiteColor,
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                      children: [
                        CustomText(
                          title: "PRICE",
                          fontSize: 17,
                        ),
                        _sizedBox(height: 2),
                        CustomText(
                          title: productModel.price + " \$",
                          fontSize: 19,
                          color: Colors.green,
                        ),
                      ],
                  ),
               CustomRaisedButton(
                    title: "ADD",
                    function: (){
                      print("add btn clicked");
                    },
                  ),
              ],
            ),
          ),),
        ],
      ),
    );
  }

  Widget _sizedBox({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }

  Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
