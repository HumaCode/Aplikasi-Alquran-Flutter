import 'package:alquran/app/data/models/surah.dart';
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
      ),
      body: FutureBuilder<List<Surah>>(
        future: controller.getAllSurah(),
        builder: (context, snapshot) {
          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xff5BA273),
                semanticsLabel: "Mohon Tunggu...",
              ),
            );
          }

          // jika datanya tidak ada
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                "Tidak ada data",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
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
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: Color(0xff5BA273),
                  child: Text("${surah.number}"),
                ),
                title: Text(
                    "Surah ${surah.name?.transliteration?.id ?? 'tidak tersedia'}"),
                subtitle: Text(
                    "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'tidak tersedia'}"),
                trailing: Text(
                  "${surah.name?.short ?? ''}",
                  style: TextStyle(fontSize: 20),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
