import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // For debugPrint
import 'package:hotelapp/model/hotelsModel.dart';

class Api2 {
  static const String apiKey =
      '9dec898d629ff2bf0a073371283362b5868904ef648e3b03524ae891235f360d';
  static const String baseUrl =
      "https://serpapi.com/search.json?engine=google_hotels&q=Bali+Resorts&check_in_date=2025-02-26&check_out_date=2025-02-27&adults=2&currency=EGP&gl=eg&hl=ar&api_key=$apiKey";
  List<Map<String, dynamic>> api = [];
  List<Hotelsmodel> hotels=[];
  Future<List<Hotelsmodel>> getHotels() async {
    try {
      final response = await Dio().get(baseUrl);

      if (response.statusCode == 200) {
        api.add(response.data);
        debugPrint(api[0]["search_parameters"]);
        hotels=api.map((e) => Hotelsmodel.fromJson(e)).toList();
        return hotels;
      } else {
        debugPrint('Error: ${response.statusCode} - ${response.data}');
        return [];
      }
    } catch (e) {
      debugPrint('$e');
      return [];
    }
  }
}
