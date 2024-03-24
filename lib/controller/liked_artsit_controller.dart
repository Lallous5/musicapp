import 'package:get/get.dart';
import 'package:musicapp/controller/login_controller.dart';
import 'package:musicapp/main.dart';
import 'dart:math';

import '../backend/AtristandGenreAPI.dart';
import '../models/artistsModel.dart';
import '../models/genreModel.dart';
import '../rout.dart';

class LikedArtistsController extends GetxController {
  AUTHController authController = Get.find();
  var likedArtists = <ArtsitModel>[].obs;
  var likedGenres = <GenretModel>[].obs;
  // var randomArtists = <ArtsitModel>[].obs;
  AtristandGenreAPI API = AtristandGenreAPI();
  var selectedArtists = RxList<int>();

  var searchQuery = ''.obs;
  @override
  void onInit() {
    // fetchRandomArtists();
    fetchLikedArtistsByUser();
    super.onInit();
  }

  // List<ArtsitModel> get filteredArtists {
  //   if (searchQuery.isEmpty) {
  //     return artists;
  //   } else {
  //     return artists.where((artist) {
  //       return artist.artistsName
  //               ?.toLowerCase()
  //               .contains(searchQuery.value.toLowerCase()) ??
  //           false;
  //     }).toList();
  //   }
  // }

  // Future<void> fetchArtists() async {
  //   try {
  //     List<ArtsitModel> responseData = await atristAPI.fetchAllArtists();
  //     artists.value = responseData;
  //     print(artists);
  //   } catch (e) {
  //     throw Exception('Failed to load artists: $e');
  //   }
  // }

  Future<void> fetchLikedArtistsByUser() async {
    try {
      List<ArtsitModel> responseData =
          await API.fetchLikedArtistsByUser(authController.userModel!.userID!);
      likedArtists.value = responseData;
      print("Liked Artist");
      print(likedArtists);
    } catch (e) {
      throw Exception('Failed to load Liked artists: $e');
    }
    update();
  }

  Future<void> fetchLikedGenresByUser() async {
    try {
      List<GenretModel> responseData =
          await API.fetchLikedGenresByUser(authController.userModel!.userID!);
      likedGenres.value = responseData;
      print("likedGenres");
      print(likedGenres);
    } catch (e) {
      throw Exception('Failed to load genres: $e');
    }
    update();
  }

  // Future<List<ArtsitModel>> fetchRandomArtists() async {
  //   try {
  //     List<ArtsitModel> allArtists = await atristAPI.fetchAllArtists();
  //     // Shuffle the list of artists
  //     allArtists.shuffle();
  //     // Get a random number of artists from the shuffled list
  //     int numberOfRandomArtists = Random().nextInt(allArtists.length);
  //     randomArtists.value = allArtists.sublist(0, numberOfRandomArtists);
  //     return randomArtists;
  //   } catch (e) {
  //     throw Exception('Failed to load random artists: $e');
  //   }
  // }

  // Future<void> handleLikedArtist() async {
  //   print("handleLikedArtist");
  //   print(authController.userModel!.userID!);
  //   print(selectedArtists);
  //   try {
  //     await atristAPI.likedArtist(
  //         selectedArtists, authController.userModel!.userID!);
  //     Get.offNamed(RouteGenerator.genre);
  //     print("Successfully liked artist(s).");
  //   } catch (e) {
  //     print("Failed to like artist(s): $e");
  //     rethrow; // Re-throw the exception to propagate it further if needed
  //   }
  // }
}
