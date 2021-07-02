import 'package:e_commerece_getx_flutter_app/model/product_model.dart';
import 'package:e_commerece_getx_flutter_app/utils/colors.dart';
import 'package:e_commerece_getx_flutter_app/view/details/details_view.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductItemWidget({Key key, this.productModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()=> Get.to(DetailsView(productModel: productModel,)),
      child: Container(
        width: size.width * 0.42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.grey.shade50
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: size.width * 0.42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.grey.shade100
              ),
              child: Image.network(productModel.image, fit: BoxFit.fill,),
            ),
            _sizedBox(height: 10),
            CustomText(title: productModel.name,color: blackColor, fontSize: 18, alignment: Alignment.topLeft,),
            _sizedBox(height: 6),
            CustomText(title: productModel.description,color: Colors.grey,fontSize: 14, alignment: Alignment.topLeft, maxLines:2),
            _sizedBox(height: 8),
            CustomText(title: productModel.price+ " \$",color: Colors.blue, alignment: Alignment.topLeft,),
            _sizedBox(height: 6),
          ],
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
