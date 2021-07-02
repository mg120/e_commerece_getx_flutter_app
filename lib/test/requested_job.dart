import 'package:el_saha/controllers/auth_view_controller.dart';
import 'package:el_saha/controllers/requested_job_controller.dart';
import 'package:el_saha/models/state_model.dart';
import 'package:el_saha/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestedJobSampleUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<AuthViewModel>(
      init: AuthViewModel(),
      builder:(controller) =>  Scaffold(
        appBar: AppBar(
          title: Text("UI Sample",style: TextStyle(fontSize: 18, ),),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    title: "Fabric Sample UI",
                    fontSize: 17,
                    alignment: Alignment.topRight,
                  ),
                  SizedBox(width: 0, height: 36.0),
                  //======================================================== State
                  Container(
                    height: 45,
                    padding: const EdgeInsets.only(
                        left: 15, right: 15, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/city.png", width: 24, height: 24,),
                        Expanded(
                          child:  DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<StateModel>(
                                isExpanded: true,
                                value: controller.selectedState,
                                iconSize: 30,
                                icon: (null),
                                style: theme.textTheme.body1.copyWith(color: Colors.grey, fontSize: 15),
                                hint: Text('اختر المدينة'),
                                onChanged: (StateModel newValue) {
                                  print(newValue.id);
                                  print(newValue.name);
                                  controller.updateSelectedState(newValue);
                                },
                                items: controller.listCities?.map((item) {
                                  return  new DropdownMenuItem(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: new Text(
                                        item.name,
                                        textAlign: TextAlign.right,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                    value: item,
                                  );
                                })?.toList() ??
                                    [],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36,),
                  controller.showContainer?Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ): Container(),

              Center(
                child: InteractiveViewer(
                  panEnabled: false, // Set it to false
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Image.asset(
                    'assets/images/slide_img_1.png',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
                  // Visibility(
                  //     maintainSize: true,
                  //     maintainAnimation: true,
                  //     maintainState: true,
                  //     visible: controller.showContainer,
                  //     child: Container(
                  //         height: 200,
                  //         width: 200,
                  //         color: Colors.green,
                  //         margin: EdgeInsets.only(top: 50, bottom: 30),
                  //         child: Center(child: Text('Show Hide Text View Widget in Flutter',
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(color: Colors.white,
                  //                 fontSize: 23)))
                  //     )
                  // ),
                ],
              ),
            ),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            controller.updateContainerVisibility();
          },
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}
