import 'package:flutter/material.dart';
import 'package:hotelapp/view/hotelsScreen.dart';

void main(List<String> args) {
  runApp(HotelsApp());
}

class HotelsApp extends StatelessWidget {
  const HotelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HotelsListScreen(),
    );
  }
}