import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConatinerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ContainerTest"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 22),
              children: [
                TextSpan(text: "Mahmoud \n"),
                TextSpan(text: "ABD" , style: TextStyle(color: Colors.blue, fontSize: 16)),
                TextSpan(text: " Mageed", style: TextStyle(color: Colors.red)),
              ],
            ),
            // textAlign: TextAlign.center,
          ),
          SizedBox(height: Get.height * 0.02,),
          Center(
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: ()=> print("item clicked"),
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  // border: Border.all(color: Colors.grey.shade500, width: 3),
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:[
                      Color(0xffF3E79A),
                      Color(0xffC5A716),
                    ],
                  ),
                  boxShadow:[
                    BoxShadow(
                      color: Colors.grey,
                      // spreadRadius: -5,
                      // blurRadius: 10,
                      blurRadius: 3.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                      offset: Offset(
                        2, // Move to right 10  horizontally
                        5.0, // Move to bottom 10 Vertically
                      ),
                    ),
                  ],
                ),
                width: Get.width * 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
