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
            color: R.colors.secondary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Quran 4.0',
                style: bold.copyWith(
                  fontSize: 25,
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
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 300,
                height: 300,
                child: Lottie.asset("assets/lotties/animasi-quran.json"),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: R.colors.secondary2,
                ),
                onPressed: () => Get.offAllNamed(Routes.HOME),
                child: Text(
                  "MULAI",
                  style: bold.copyWith(
                    fontSize: 25,
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
