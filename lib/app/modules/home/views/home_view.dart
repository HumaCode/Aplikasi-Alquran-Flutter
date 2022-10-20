import 'package:alquran/app/constants/constants.dart';
import 'package:alquran/app/constants/r.dart';
import 'package:alquran/app/constants/theme.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    if (Get.isDarkMode) {
      controller.isDark.value = true;
    }

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
      body: Obx(
        () => DefaultTabController(
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
                    color: controller.isDark.isTrue
                        ? R.colors.purple30
                        : R.colors.primary,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        controller.isDark.isTrue
                            ? R.colors.purple
                            : R.colors.primary2,
                        controller.isDark.isTrue
                            ? R.colors.purple600
                            : R.colors.secondary2,
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
                                  child: controller.isDark.isTrue
                                      ? Image.asset(
                                          "assets/images/alquran2.png",
                                          fit: BoxFit.contain,
                                        )
                                      : Image.asset(
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
                                        color: controller.isDark.isTrue
                                            ? R.colors.wheat
                                            : R.colors.primary3,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Terakhir dibaca",
                                        style: regular.copyWith(
                                          color: controller.isDark.isTrue
                                              ? R.colors.wheat
                                              : R.colors.primary3,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    "Al-Fatihah",
                                    style: regular.copyWith(
                                      color: controller.isDark.isTrue
                                          ? R.colors.wheat
                                          : R.colors.primary3,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "Juz 1 | Ayat 3",
                                    style: regular.copyWith(
                                      color: controller.isDark.isTrue
                                          ? R.colors.wheat
                                          : R.colors.primary3,
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
                      // SURAH
                      FutureBuilder<List<Surah>>(
                        future: controller.getAllSurah(),
                        builder: (context, snapshot) {
                          // loading
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Get.isDarkMode
                                    ? R.colors.wheat
                                    : R.colors.primary,
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
                                  color: Get.isDarkMode
                                      ? R.colors.wheat
                                      : R.colors.primary,
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
                                leading: Container(
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
                                      "${surah.number}",
                                      style: regular.copyWith(
                                        fontSize: 18,
                                        color: controller.isDark.isTrue
                                            ? R.colors.purple200
                                            : R.colors.primary,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Surah ${surah.name?.transliteration?.id ?? 'tidak tersedia'}",
                                  style: regular,
                                ),
                                subtitle: Text(
                                    "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'tidak tersedia'}",
                                    style: regular),
                                trailing: Text(
                                  "${surah.name?.short ?? ''}",
                                  style: regular.copyWith(fontSize: 20),
                                ),
                              );
                            },
                          );
                        },
                      ),

                      // JUZ
                      ListView.builder(
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                // pindah halaman sambil membawa parameter surah
                                // Get.toNamed(Routes.DETAIL_SURAH,
                                //     arguments: surah);
                              },
                              leading: Container(
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
                                    "${index + 1}",
                                    style: regular.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text("Juz ${index + 1}", style: regular),
                              subtitle: Text(" ${index + 1}", style: regular),
                            );
                          }),

                      // BOOKMARK
                      Center(child: Text("data")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // floating ganti tema
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ubah tema
          Get.isDarkMode ? Get.changeTheme(appLight) : Get.changeTheme(appDark);

          controller.isDark.toggle();
          // print(Get.isDarkMode);
        },
        child: Icon(
          CupertinoIcons.color_filter,
          color: R.colors.purple900,
          size: 40,
        ),
      ),
    );
  }
}
