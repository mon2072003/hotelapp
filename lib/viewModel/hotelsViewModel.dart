import 'package:flutter/material.dart';
import 'package:hotelapp/model/hotelsModel.dart';
import 'package:hotelapp/repository/api.dart';

class HotelsViewModel with ChangeNotifier{
Api api=Api();
List<Hotelsmodel> _hotelsData=[];
Future<List<Hotelsmodel>>getHotelsData()async{
  _hotelsData=await api.getHotels();
  notifyListeners();
  return _hotelsData;
}
List<Hotelsmodel>get hotelsDataList=>_hotelsData;
}