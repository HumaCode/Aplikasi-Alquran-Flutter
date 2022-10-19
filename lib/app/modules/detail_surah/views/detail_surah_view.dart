import 'package:alquran/app/constants/constants.dart';
import 'package:alquran/app/constants/r.dart';
import 'package:alquran/app/data/models/detail_surah.dart' as detail;
import 'package:alquran/app/data/models/surah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  // menangkap parameter yangg dikirim
  final Surah surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surah ${surah.name?.transliteration?.id ?? ''}"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          Card(
            color: Get.isDarkMode ? R.colors.purple : R.colors.secondary3,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "${surah.name?.transliteration?.id ?? ''}",
                    style: bold.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${surah.numberOfVerses ?? ''} Ayat | ${surah.revelation?.id ?? ''} | ${surah.name?.translation?.id ?? ''}",
                    style: regular.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          FutureBuilder<detail.DetailSurah>(
            future: controller.getDetailSurah(surah.number.toString()),
            builder: (context, snapshot) {
              // loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Get.isDarkMode ? R.colors.wheat : R.colors.primary,
                  ),
                );
              }

              // jika datanya tidak ada
              if (!snapshot.hasData) {
                return Center(
                  child: Text(
                    "Tidak ada data",
                    style: regular.copyWith(
                      fontSize: 18,
                      color: Get.isDarkMode ? R.colors.wheat : R.colors.primary,
                    ),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data?.verses?.length ?? 0,
                itemBuilder: (context, index) {
                  if (snapshot.data?.verses?.length == 0) {
                    return SizedBox();
                  }

                  // tampilkasn data
                  detail.Verse? ayat = snapshot.data?.verses?[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Card(
                        color: Get.isDarkMode
                            ? R.colors.purple800
                            : R.colors.secondary3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/bingkai.png"),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "${surah.number}",
                                    style: regular.copyWith(
                                      fontSize: 18,
                                      color: Get.isDarkMode
                                          ? R.colors.wheat
                                          : R.colors.primary,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_add,
                                      color: Get.isDarkMode
                                          ? R.colors.purple
                                          : R.colors.primary,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_arrow_rounded,
                                      color: Get.isDarkMode
                                          ? R.colors.purple
                                          : R.colors.primary,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${ayat!.text?.arab}",
                              style: regular.copyWith(
                                fontSize: 28,
                                color: R.colors.wheat2,
                              ),
                              textAlign: TextAlign.end,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${ayat.text?.transliteration?.en}",
                              style: regular.copyWith(
                                fontSize: 18,
                                color: Get.isDarkMode
                                    ? R.colors.purple10
                                    : R.colors.primary,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "${ayat.translation?.id}",
                              style: regular.copyWith(
                                fontSize: 18,
                                color: Get.isDarkMode
                                    ? R.colors.purple30
                                    : R.colors.black,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
