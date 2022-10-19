import 'package:alquran/app/constants/constants.dart';
import 'package:alquran/app/constants/r.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Get.isDarkMode ? R.colors.white : R.colors.secondary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Quran 4.0',
                style: bold.copyWith(
                  fontSize: 30,
                  color:
                      Get.isDarkMode ? R.colors.purple700 : R.colors.primary3,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '"Sesibukah kamu sampai kau tidak pernah membaca ku..?"',
                  style: regular.copyWith(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Get.isDarkMode
                          ? R.colors.purple600
                          : R.colors.primary3),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 300,
                  height: 300,
                  child: Get.isDarkMode
                      ? Lottie.asset("assets/lotties/animasi-quran2.json")
                      : Lottie.asset("assets/lotties/animasi-quran.json"),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor:
                      Get.isDarkMode ? R.colors.orange : R.colors.secondary2,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Get.offAllNamed(Routes.HOME),
                child: Text(
                  "MULAI",
                  style: bold.copyWith(
                    fontSize: 25,
                    color:
                        Get.isDarkMode ? R.colors.secondary3 : R.colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
