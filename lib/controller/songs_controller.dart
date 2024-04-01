import 'package:get/get.dart';
import 'package:musicapp/backend/songs.dart';
import 'package:musicapp/controller/login_controller.dart';

import 'package:musicapp/models/songsModel.dart';
import 'dart:math';

import '../models/artistsModel.dart';

import 'artists_controller.dart';

class SongsController extends GetxController {
  AUTHController authController = Get.find();
  ArtistsController artistsController = Get.find();
  var songs = <SongsModel>[].obs;
  // var randomArtists = <ArtsitModel>[].obs;
  SongsAPI songAPI = SongsAPI();

  var searchQuery = ''.obs;
  @override
  void onInit() {
    // fetchsongs();
    // fetchRandomArtists();
    // fetchLikedArtistsByUser();
    super.onInit();
  }

  List<SongsModel> get filteresongs {
    if (searchQuery.isEmpty) {
      return songs;
    } else {
      return songs.where((songs) {
        return songs.songName
                ?.toLowerCase()
                .contains(searchQuery.value.toLowerCase()) ??
            false;
      }).toList();
    }
  }

  Future<void> fetchsongs(int userID) async {
    try {
      List<SongsModel> responseData =
          await songAPI.fetchSongsByArtistID(userID);
      songs.value = responseData;
      print(songs);
    } catch (e) {
      throw Exception('Failed to load songs: $e');
    }
  }
}
