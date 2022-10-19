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
            color: Color(0xffF2FBF6),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "${surah.name?.transliteration?.id ?? ''}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${surah.numberOfVerses ?? ''} Ayat | ${surah.revelation?.id ?? ''} | ${surah.name?.translation?.id ?? ''}",
                    style: TextStyle(
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
                    color: R.colors.primary,
                  ),
                );
              }

              // jika datanya tidak ada
              if (!snapshot.hasData) {
                return Expanded(
                  child: Center(
                    child: Text(
                      "Tidak ada data",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
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
                        color: Color(0xffF2FBF6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: R.colors.primary,
                                child: Text("${index + 1}"),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark_add,
                                      color: R.colors.primary,
                                      size: 20,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_arrow_rounded,
                                      color: R.colors.primary,
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
                              style: TextStyle(fontSize: 28),
                              textAlign: TextAlign.end,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${ayat.text?.transliteration?.en}",
                              style: TextStyle(
                                fontSize: 18,
                                color: R.colors.primary,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "${ayat.translation?.id}",
                              style: TextStyle(fontSize: 18),
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
