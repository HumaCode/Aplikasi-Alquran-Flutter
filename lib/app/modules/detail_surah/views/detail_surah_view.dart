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
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Surah ${surah.name?.transliteration?.id ?? ''}"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          GestureDetector(
            onTap: () => Get.dialog(
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.isDarkMode
                        ? R.colors.purple800
                        : R.colors.secondary3,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Tafsir -  ${surah.name?.transliteration?.id ?? ''}",
                        style: bold.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      Divider(
                        color: R.colors.primary,
                        thickness: 3,
                      ),
                      Text(
                        "${surah.tafsir?.id ?? 'Tidak ada tafsir'}",
                        style: regular.copyWith(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // onTap: () => Get.defaultDialog(
            //   backgroundColor:
            //       Get.isDarkMode ? R.colors.purple800 : R.colors.secondary3,
            //   title: "Tafsir",
            //   titleStyle: bold,
            //   content: Padding(
            //     padding: const EdgeInsets.all(10),
            //     child: Container(
            //       child: Text(
            //         "${surah.tafsir?.id ?? 'Tidak ada tafsir'}",
            //         style: regular.copyWith(
            //           fontSize: 18,
            //         ),
            //         textAlign: TextAlign.justify,
            //       ),
            //     ),
            //   ),
            // ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Get.isDarkMode ? R.colors.purple : R.colors.primary2,
                    controller.isDark.isTrue
                        ? R.colors.purple600
                        : R.colors.secondary2,
                  ],
                ),
              ),
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Get.isDarkMode
                              ? R.colors.purple800
                              : R.colors.secondary4,
                          border: Border.all(
                            color: Get.isDarkMode
                                ? R.colors.purple
                                : R.colors.secondary4,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: controller.isDark.isTrue
                                          ? AssetImage(
                                              "assets/images/bingkai2.png")
                                          : AssetImage(
                                              "assets/images/bingkai.png"),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${ayat!.number!.inSurah}",
                                      style: regular.copyWith(
                                        fontSize: 18,
                                        color: Get.isDarkMode
                                            ? R.colors.purple200
                                            : R.colors.primary,
                                      ),
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
                                          ? R.colors.purple200
                                          : R.colors.primary,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_arrow_rounded,
                                      color: Get.isDarkMode
                                          ? R.colors.purple200
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
                                fontSize: 35,
                                color: Get.isDarkMode
                                    ? R.colors.purple5
                                    : R.colors.black,
                              ),
                              textAlign: TextAlign.end,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${ayat.text?.transliteration?.en}",
                              style: regular.copyWith(
                                fontSize: 18,
                                color: Get.isDarkMode
                                    ? R.colors.purple5
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
                                    ? R.colors.wheat2
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
