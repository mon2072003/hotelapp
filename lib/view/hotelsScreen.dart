import 'package:flutter/material.dart';
import 'package:hotelapp/model/hotelsModel.dart';
import 'package:hotelapp/viewModel/hotelsViewModel.dart';
import 'package:hotelapp/widgets/hotelCard.dart';
import 'package:provider/provider.dart';

class HotelsListScreen extends StatelessWidget {
  const HotelsListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HotelsViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hotels',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Consumer<HotelsViewModel>(
          builder: (context, value, child) {
            return FutureBuilder<List<Hotelsmodel>>(
              future: value.getHotelsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final hotels = snapshot.data!;
                  return ListView.builder(
                    itemCount: hotels[0].properties?.length,
                    itemBuilder: (context, index) {
                      final hotel = hotels[0].properties?[index];
                      return HotelCard(properties: hotel);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

