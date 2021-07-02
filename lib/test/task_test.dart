import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class TaskTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width * 0.7,
          height: size.height * 0.35,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(size.width / 2)),
                child:  Row(
                    children: [
                      Expanded(child: Container(
                        color: Colors.green,
                        child: Column(
                          children: [
                            // Expanded(child: Container(
                            //   color: Colors.orangeAccent,
                            // )),
                            // ClipPath(
                            //   child: Container(
                            //     width: size.width * 0.35,
                            //     height: 120,
                            //     // width: MediaQuery.of(context).size.width,
                            //     color: Colors.orangeAccent,
                            //   ),
                            //   clipper: CustomClipPath(),
                            // ),
                            ClipPath(
                              clipper: DiagonalPathClipperOne(),
                              child: Container(
                                height: 116,
                                color: Colors.orangeAccent,
                                child: Center(child: Text("Diagonal")),
                              ),
                            ),
                            Expanded(
                                child: Container(
                                    color: Colors.green,
                                    child: Center(child: Text("Diagonal")),
                                  ),
                                ),
                          ],
                        ),
                      )),
                      SizedBox(width: 1.0,),
                      Expanded(child: Container(
                        color: Colors.purple,
                        child: Column(
                          children: [
                            ClipPath(
                              clipper: DiagonalPathClipperTwo(),
                              child: Container(
                                height: 116,
                                color: Colors.blue,
                                child: Center(child: Text("Diagonal")),
                              ),
                            ),
                            SizedBox(width: 6.0,),
                            Expanded(child: Container(
                              color: Colors.purple,
                            ))
                          ],
                        ),
                      )),
                    ],
                  ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 10.0),
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.nightlight_round, color: Colors.white,),
                    onPressed: null,
                  ),
                ),
              ),
              // Positioned(
              //   top: -16,
              //   left: -16,
              //   child: Container(
              //     width: 75,
              //     height: 75,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: Colors.transparent,
              //       border: Border.all(color: Colors.grey.shade700, width: 16),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
class CustomClipPath extends CustomClipper<Path> {
  var radius=0.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.arcToPoint(Offset(size.width, size.height),
        radius: Radius.elliptical(radius, 20));
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
