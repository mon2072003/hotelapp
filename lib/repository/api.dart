import 'dart:convert';
import 'package:flutter/foundation.dart'; // For debugPrint
import 'package:http/http.dart' as http;
import 'package:hotelapp/model/hotelsModel.dart';

class Api {
  static String checkInDate=DateTime.now().toString();
  static String checkOutDate=DateTime.now().add(Duration(days: 1)).toString();
  static const String apiKey =
      '9dec898d629ff2bf0a073371283362b5868904ef648e3b03524ae891235f360d';
  static String baseUrl =
      "https://serpapi.com/search.json?engine=google_hotels&q=Cairo+Resorts&check_in_date=$checkInDate&check_out_date=$checkOutDate&adults=2&currency=EGP&gl=eg&hl=ar&api_key=$apiKey";
  List<Map<String, dynamic>> api = [];
  List<Hotelsmodel> hotels=[];
  Future<List<Hotelsmodel>> getHotels() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        api.add(jsonDecode(response.body));
        hotels=api.map((e) => Hotelsmodel.fromJson(e)).toList();
        debugPrint(hotels[0].properties?.length.toString());
        return hotels;
      } else {
        debugPrint('Error: ${response.statusCode} - ${response.body}');
        return [];
      }
    } catch (e) {
      debugPrint('$e');
      return [];
    }
  }
}
