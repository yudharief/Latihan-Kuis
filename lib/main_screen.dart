import 'dart:html';

import 'package:flutter/material.dart';
import 'package:latkuis/detail_place.dart';
import 'package:latkuis/tourism_place.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agen Wisata Turis"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = tourismPlaceList[index];

          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(place: place)));
            },
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 80,
                    // width: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        colorFilter: ColorFilter.mode(
                            Colors.deepOrange.withOpacity(0.2),
                            BlendMode.dstOut),
                        image: NetworkImage(place.imageUrls[0]),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          place.name,
                          style: TextStyle(
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          place.ticketPrice,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.white,
                                    blurRadius: 10,
                                    offset: Offset(2, 2))
                              ],
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Image.network(place.imageUrls[0], width: 120,),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Text(
                  //   place.name,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 20,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Text(
                  //   place.ticketPrice,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 16,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                ],
              ),
            ),
          );
        },
        itemCount: tourismPlaceList.length,
      ),
    );
  }
}
