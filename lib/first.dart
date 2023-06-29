import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/api.dart';

class first extends StatelessWidget {
  const first({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextButton(
              onPressed: () {
                Get.to(() => apicall());
              },
              child: Text("GetX with http")),
          TextButton(
              onPressed: () {
                Get.toNamed("/Getconnect");
              },
              child: Text("GetX with getconnect"))
        ]),
      ),
    ));
  }
}
