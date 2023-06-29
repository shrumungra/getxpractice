import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/api.dart';
import 'package:getxpractice/api2.dart';

class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(children: [
          TextButton(onPressed: () {
            Get.to(() => apicall());

          }, child: Text("GetX with http")),
          TextButton(onPressed: () {
            Get.toNamed("/Getconnect");
          }, child: Text("GetX with getconnect"))
        ]),
      ),
    ));
  }
}
