import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxpractice/api.dart';
import 'package:getxpractice/api2.dart';
import 'package:getxpractice/first.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    // unknownRoute: GetPage(name: '/notfound', page: () => UnknownRoutePage()), //like 404 page in we
    getPages: [
      GetPage(
        name: '/',
        page: () => first(),
      ),
      GetPage(
        name: '/http',
        page: () => apicall(),
      ),
      GetPage(
        name: '/Getconnect',
        page: () => api2(),
          transition: Transition.zoom,
      ),
    ],
  ));
}
