import 'package:el_saha/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class LinearProgressExScreen extends StatelessWidget {
  double _progress = 0.35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          // height: 200,
          // width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    child: new CircularPercentIndicator(
                      radius: 110.0,
                      lineWidth: 12.0,
                      animation: true,
                      percent: 0.6,
                      center: new Text(
                        "70.0%",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      // footer: new Text(
                      //   "Sales this week",
                      //   style:
                      //   new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                      // ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Colors.purple,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        catProgressWidget("PROTEIN", 0.4, 0xff00ff00, "72g left"),
                        SizedBox(height: 6,),
                        catProgressWidget("CARBS", 0.4, 0xff00ff00, "252g left"),
                        SizedBox(height: 6,),
                        catProgressWidget("FAT", 0.4, 0xff00ff00, "61g left"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget catProgressWidget(String headerText, double progressValue, int valueColor, String trailText){
    return Column(
        children: [
          CustomText(
            title: headerText,
            alignment: Alignment.topLeft,
            fontSize: 13,
            color: Colors.black,
          ),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.all(Radius.circular(10)),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    minHeight: 9,
                    valueColor: new AlwaysStoppedAnimation<Color>(
                        Color(valueColor)),
                    backgroundColor: Color(0xffD6D6D6),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              CustomText(
                title: trailText,
                alignment: Alignment.topLeft,
                fontSize: 13,
                color: Colors.black87,
              ),
            ],
          ),
        ],
    );
  }
}
