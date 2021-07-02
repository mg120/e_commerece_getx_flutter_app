import 'package:e_commerece_getx_flutter_app/model/category_model.dart';
import 'package:e_commerece_getx_flutter_app/utils/colors.dart';
import 'package:e_commerece_getx_flutter_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem({Key key, this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> print(categoryModel.name),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade200
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 60, width: 100,
                  child: Image.network(categoryModel.image, height: 50, width: 50,)),
              SizedBox(height: 12,),
              CustomText(title: categoryModel.name, color: blackColor,alignment: Alignment.center,)
            ],
          ),
        ),
      ),
    );
  }
}
