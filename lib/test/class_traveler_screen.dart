import 'package:el_saha/controllers/class_traveler_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClassTravelerScreen extends StatelessWidget {
  final Color colorActive = Color(0xff00D7FF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class & Traveler"),
        centerTitle: true,
      ),
      body: GetBuilder<ClassTravelerController>(
        init: ClassTravelerController(),
        builder:(controller) =>  Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildClass("Economy", controller),
                  _buildClass("Pro Economy", controller),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildClass("Business", controller),
                  _buildClass("First Class", controller),
                ],
              ),
              SizedBox(height: 28,),
              _travelerCount( 'adults',controller.travelers['adults'], "Adult 18-64", controller),
              _travelerCount('senior', controller.travelers['senior'], "Senior 65+", controller),
              _travelerCount('youth', controller.travelers['youth'], "Youth 12-17", controller),
              _travelerCount('child', controller.travelers['child'], "Child 2-11", controller),
              _travelerCount('seat_infant_under', controller.travelers['seat_infant_under'], "Seat Infant Under 2", controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClass(String txt, ClassTravelerController controller){
    bool isSelected = controller.classes == txt;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: ()=> controller.updateClass(txt),
      child: Container(
        width: 140,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: !isSelected?Border.all(width: 1, color: Colors.grey): null,
          color: isSelected? colorActive:  Colors.grey.shade200,
          boxShadow: isSelected?[
            BoxShadow(
              color: colorActive,
              blurRadius: 20,
              spreadRadius: -5
            )
          ] : null,
        ),
        child: Text(
          txt, style: TextStyle(color: isSelected? Colors.white: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _travelerCount(String type, int num, String subTitle, ClassTravelerController controller){
    int traveler = controller.travelers[type];// to get value in map
    print(traveler.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.add_circle_outline, size: 30,color: Colors.black54,), onPressed: (){
            traveler++;
            controller.numTravelers++;
            controller.onChangeTraveler(type, traveler);
            controller.update();
          }),
          Expanded(child: Text.rich(TextSpan(
            children: <TextSpan>[
              new TextSpan(
                  text: '$num \n',
                  style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 17)),
              new TextSpan(text: ' $subTitle', style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
            textAlign: TextAlign.center,
          ),),
          IconButton(icon: Icon(Icons.remove_circle_outline, size: 30,color: Colors.black54,), onPressed: (){
            if(traveler > 0){
              traveler--;
              controller.numTravelers--;
              controller.onChangeTraveler(type, traveler);
            }
          }),
        ],
      ),
    );
  }
}
