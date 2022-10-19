import 'dart:convert';

import 'package:alquran/app/data/models/ayat.dart';
import 'package:alquran/app/data/models/detail_surah.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  // url semua surah
  // Uri uri = Uri.parse("https://api.quran.gading.dev/surah");
  // var res = await http.get(uri);

  // // // decode data
  // List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  // // // print(data[113]);

  // // // ubah data dari api -> kebentuk model
  // Surah surahAnnas = Surah.fromJson(data[113]);

  // print(surahAnnas.name!.short);
  // print(surahAnnas.number);
  // print(surahAnnas.numberOfVerses);

  // ===================================== //

  // detail surah
  // Uri urlAnnas =
  //     Uri.parse("https://api.quran.gading.dev/surah/${surahAnnas.number}");
  // var response = await http.get(urlAnnas);

  // // di decode dulu agar bisa mengambil dalam bentuk objeknya dari api
  // Map<String, dynamic> dataAnnas =
  //     (json.decode(response.body) as Map<String, dynamic>)["data"];

  // // print(dataAnnas);

  // // // ubah data dari api -> kebentuk model (detail surah)
  // DetailSurah annas = DetailSurah.fromJson(dataAnnas);

  // print(annas.verses![0].text!.arab);

  // ======================== //
  // https: //api.quran.gading.dev/surah/108/1
  Uri urlAyat = Uri.parse("https://api.quran.gading.dev/surah/108/1");
  var resAyat = await http.get(urlAyat);

  Map<String, dynamic> data = json.decode(resAyat.body)["data"];
  Map<String, dynamic> dataModel = {
    "number": data["number"],
    "meta": data["meta"],
    "text": data["text"],
    "translation": data["translation"],
    "audio": data["audio"],
    "tafsir": data["tafsir"],
  };

  print(dataModel);
  // convert ke bentuk model ayat
  Ayat ayat = Ayat.fromJson(dataModel);
  print(ayat);
}
