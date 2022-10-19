import 'package:alquran/app/constants/r.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: R.colors.secondary,
        appBarTheme: AppBarTheme(
          backgroundColor: R.colors.primary,
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
