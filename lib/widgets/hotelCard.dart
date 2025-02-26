// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotelapp/model/hotelsModel.dart';
class HotelCard extends StatelessWidget {
  late Properties? properties;
  HotelCard({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          CarouselSlider(
              items: properties?.images!
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          e.originalImage??"",
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true)),
          ListTile(
            title: Text(
              properties?.name!??"",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Icon(
              Icons.hotel,
              color: Colors.blue,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Icon(Icons.location_on, color: Colors.red),
              Expanded(
                child: Text(properties!.nearbyPlaces!.isEmpty
                    ? ""
                    : properties?.nearbyPlaces![0].name!??""),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("check in", style: TextStyle(color: Colors.grey)),
                        Text(
                          ' ${properties?.checkInTime??""} ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("check out", style: TextStyle(color: Colors.grey)),
                        Text(
                          ' ${properties?.checkOutTime??""} ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Text(
                      ' ${properties?.overallRating??""} ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Icon(Icons.monetization_on_sharp, color: Colors.green),
                    Text(
                      ' ${properties?.totalRate!.lowest??""} ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.room_service, color: Colors.blue),
                    Text(
                      "amenities",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        ' ${properties?.amenities??""} ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
