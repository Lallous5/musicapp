import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/artists_controller.dart';
import 'package:musicapp/models/artistsModel.dart';

class ArtistScreen extends StatefulWidget {
  ArtsitModel artsitModel;
  ArtistScreen({super.key, required this.artsitModel});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  ArtistsController artistsController = Get.find();

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
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    widget.artsitModel.artistImage ?? '',
                    fit: BoxFit.cover,
                    width: Get.width,
                    height: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: ScaleTap(
                      enableFeedback: false,
                      onPressed: () {
                        Get.back();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                            child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 10,
                      child: Text(
                        widget.artsitModel.artistsName ?? "",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 44,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: ScaleTap(
                  enableFeedback: false,
                  onPressed: () {
                    Get.back();
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "Following",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 25),
                child: Text(
                  "Popular",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                             "1",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Image.network(
                            widget.artsitModel.artistImage ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.artsitModel.artistsName ?? "",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
