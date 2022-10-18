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
            color: Color(0xffD1F1DD),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'My Quran 4.0',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '"Sesibukah kamu sampai kau tidak pernah membaca ku..?"',
                  style: TextStyle(
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
                  backgroundColor: Color(0xff70B989),
                ),
                onPressed: () => Get.offAllNamed(Routes.HOME),
                child: Text(
                  "MULAI",
                  style: TextStyle(
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
