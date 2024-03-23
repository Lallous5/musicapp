import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:musicapp/controller/artists_controller.dart';
import 'package:musicapp/main.dart';

import '../../models/artistsModel.dart';
import 'artsits_card.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  ArtistsController artistsController = Get.put(ArtistsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 50, 50, 50),
        body: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 5),
                  child: Text("Choose 3 or more artists you like.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Set background color
                        borderRadius:
                            BorderRadius.circular(10.0), // Set border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Set shadow color
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          artistsController.searchQuery.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none, // Hide default border
                          contentPadding: EdgeInsets.all(15.0),
                        ),
                      ),
                    ),
                  ),
                ),
                artistsController.artists.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : Wrap(
                        spacing: 30.0,
                        runSpacing: 30.0,
                        children:
                            artistsController.filteredArtists.map((artist) {
                          bool isSelected = artistsController.selectedArtists
                              .contains(artist.artistID);
                          return ArtistCircleWidget(
                            artist: artist,
                            isSelected: isSelected,
                            onSelect: (bool value) {
                              artistsController.selectedArtists
                                      .contains(artist.artistID)
                                  ? artistsController.selectedArtists
                                      .remove(artist.artistID)
                                  : artistsController.selectedArtists
                                      .add(artist.artistID!);

                              print(artistsController.selectedArtists);
                              // Handle selection logic
                              // artistsController.selectArtist(index, value);
                            },
                          );
                        }).toList(),
                      ),
              ],
            ),
            artistsController.selectedArtists.length < 3
                ? Container()
                : Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: InkWell(
                        onTap: () {
                          // Handle button press
                          loadingOverlay(context);
                          artistsController.handleLikedArtist();
                        },
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            gradient: LinearGradient(
                              colors: [
                                Colors.green.shade400,
                                Colors.green.shade700
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.shade700.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 8.0),
                              Text(
                                'DONE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      );
    });
  }
}
