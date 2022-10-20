import 'dart:convert';

import 'package:alquran/app/constants/api_url.dart';
import 'package:alquran/app/data/models/detail_surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  RxBool isDark = false.obs;

  // function get detail surah
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri uri = Uri.parse(ApiUrl.allSurah + "/${id}");
    var res = await http.get(uri);

    // // decode data
    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    // ubah ke bentuk list
    return DetailSurah.fromJson(data);
  }
}
