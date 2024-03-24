import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/genre_controller.dart';
import 'package:musicapp/controller/liked_artsit_controller.dart';
import 'package:musicapp/pages/artist_page.dart';
import 'package:musicapp/pages/recommendations/artsits_card.dart';
import 'package:musicapp/pages/recommendations/genre_card.dart';
import 'package:musicapp/pages/recommendations/liked_card.dart';

import '../controller/artists_controller.dart';
import '../controller/login_controller.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  AUTHController loginController = Get.find();
  LikedArtistsController likedartistsController =
      Get.put(LikedArtistsController());
  bool isMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 27, 32, 44),
                  Color.fromARGB(233, 27, 32, 44),
                ],
                stops: [0.1, 1.0],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15),
                    child: Row(children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/3721941/pexels-photo-3721941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Library",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ]),
                  ),
                  ScaleTap(
                    enableFeedback: false,
                    onPressed: () {},
                    child: Container(
                      color: Colors.transparent,
                      height: 100,
                      width: Get.width * 0.2,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 33,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    likedartistsController.likedArtists.isEmpty
                        ? Center(
                            child: Text(
                            'No Liked Artists',
                            textAlign: TextAlign.center,
                          ))
                        : Center(
                            child: Wrap(
                              spacing: 20.0,
                              runSpacing: 20.0,
                              children: [
                                // Adding the Song object
                                LikedSongCard(onSelect: () {}),
                                // Mapping through liked artists
                                ...likedartistsController.likedArtists
                                    .map((likedartist) {
                                  return ArtistCircleWidget(
                                    artist: likedartist,
                                    isLibrary: true,
                                    onSelect: (bool value) {
                                      Get.to(() => ArtistScreen(
                                          artsitModel: likedartist));
                                      print(likedartist.artistID);
                                    },
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
