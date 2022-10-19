import 'package:alquran/app/constants/constants.dart';
import 'package:alquran/app/constants/r.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Quran'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.SEARCH),
            icon: Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalammualaikum",
                style: bold.copyWith(
                  fontSize: 20,
                  color: R.colors.primary,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      R.colors.primary2,
                      R.colors.secondary2,
                    ],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Get.toNamed(Routes.LAST_READ),
                    child: Container(
                      height: 150,
                      width: Get.width,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -50,
                            right: 0,
                            child: Opacity(
                              opacity: 0.7,
                              child: Container(
                                width: 200,
                                height: 200,
                                child: Image.asset(
                                  "assets/images/alquran.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.book_fill,
                                      color: R.colors.primary3,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      "Terakhir dibaca",
                                      style: regular.copyWith(
                                        color: R.colors.primary3,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                Text(
                                  "Al-Fatihah",
                                  style: regular.copyWith(
                                    color: R.colors.primary3,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Juz 1 | Ayat 3",
                                  style: regular.copyWith(
                                    color: R.colors.primary3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // tab baar
              TabBar(
                indicatorColor: R.colors.primary,
                labelColor: R.colors.primary,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "Surah",
                      style: regular,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Juz",
                      style: regular,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Bookmark",
                      style: regular,
                    ),
                  ),
                ],
              ),

              // tab bar view
              Expanded(
                child: TabBarView(
                  children: [
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        // loading
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: R.colors.primary,
                            ),
                          );
                        }

                        // jika datanya tidak ada
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text(
                              "Tidak ada data",
                              style: bold.copyWith(
                                fontSize: 18,
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            // ambil datanya per surah
                            Surah surah = snapshot.data![index];

                            return ListTile(
                              onTap: () {
                                // pindah halaman sambil membawa parameter surah
                                Get.toNamed(Routes.DETAIL_SURAH,
                                    arguments: surah);
                              },
                              leading: CircleAvatar(
                                backgroundColor: Color(0xff5BA273),
                                child: Text(
                                  "${surah.number}",
                                  style: regular,
                                ),
                              ),
                              title: Text(
                                "Surah ${surah.name?.transliteration?.id ?? 'tidak tersedia'}",
                                style: regular,
                              ),
                              subtitle: Text(
                                "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'tidak tersedia'}",
                                style: regular,
                              ),
                              trailing: Text(
                                "${surah.name?.short ?? ''}",
                                style: regular.copyWith(fontSize: 20),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Center(child: Text("data")),
                    Center(child: Text("data")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
