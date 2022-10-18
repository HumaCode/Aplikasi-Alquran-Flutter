import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffD1F1DD),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff5BA273),
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: "Quran App",
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
    ),
  );
}
