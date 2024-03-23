import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get/get.dart';
import 'package:musicapp/pages/recommendations/artsits_card.dart';

import '../controller/artists_controller.dart';
import '../controller/login_controller.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  AUTHController loginController = Get.find();
  ArtistsController artistsController = Get.put(ArtistsController());
  bool isMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 27, 32, 44),
                Color.fromARGB(233, 27, 32, 44),
              ],
              stops: [0.1, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(loginController.userModel!.userName ?? "",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Text("Free Member",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14))
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              size: 33,
                              color: Colors.white30,
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Listen The Latest Musics",
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 25)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: Text("Recommended For You",
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 18)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 20, right: 20),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isMore = !isMore;
                          print(isMore);
                        });
                      },
                      child: Text(
                        "More...",
                        style: const TextStyle(
                            color: Colors.greenAccent, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              artistsController.randomArtists.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: artistsController.randomArtists.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            // If isMore is false or index is within range, build the ArtistCircleWidget
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ArtistCircleWidget(
                                artist: artistsController.randomArtists[index],
                                onSelect: (p0) {},
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
