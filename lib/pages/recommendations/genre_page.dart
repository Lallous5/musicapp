import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:musicapp/controller/genre_controller.dart';
import 'package:musicapp/main.dart';
import 'package:musicapp/pages/recommendations/genre_card.dart';

import 'artsits_card.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  GenresController genreController = Get.put(GenresController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 50, 50, 50),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 5),
                    child: Text("Choose 3 or more Genres you like.",
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            genreController.searchQuery.value = value;
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
                  genreController.genres.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : Wrap(
                          spacing: 25.0,
                          runSpacing: 20.0,
                          children:
                              genreController.filteredArtists.map((genre) {
                            bool isSelected = genreController.selectedGenre
                                .contains(genre.genreID);
                            return GenreSquareWidget(
                              genre: genre,
                              isSelected: isSelected,
                              onSelect: (bool value) {
                                genreController.selectedGenre
                                        .contains(genre.genreID)
                                    ? genreController.selectedGenre
                                        .remove(genre.genreID)
                                    : genreController.selectedGenre
                                        .add(genre.genreID!);

                                print(genreController.selectedGenre);
                                // Handle selection logic
                                // artistsController.selectArtist(index, value);
                              },
                            );
                          }).toList(),
                        ),
                ],
              ),
            ),
            genreController.selectedGenre.length < 3
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
                          genreController.handleLikedGenre();
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
