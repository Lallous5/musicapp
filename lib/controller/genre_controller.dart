import 'package:get/get.dart';
import 'package:musicapp/controller/login_controller.dart';
import 'package:musicapp/main.dart';
import 'package:musicapp/models/genreModel.dart';

import '../backend/AtristandGenreAPI.dart';
import '../models/artistsModel.dart';
import '../rout.dart';

class GenresController extends GetxController {
  AUTHController authController = Get.find();
  var genres = <GenretModel>[].obs;
  AtristandGenreAPI genreAPI = AtristandGenreAPI();
  var selectedGenre = RxList<int>();

  var searchQuery = ''.obs;

  @override
  void onInit() {
    fetchGenres();
    // fetchLikedGenresByUser();
    super.onInit();
  }

  List<GenretModel> get filteredArtists {
    if (searchQuery.isEmpty) {
      return genres;
    } else {
      return genres.where((artist) {
        return artist.genreType
                ?.toLowerCase()
                .contains(searchQuery.value.toLowerCase()) ??
            false;
      }).toList();
    }
  }

  Future<void> fetchGenres() async {
    try {
      List<GenretModel> responseData = await genreAPI.fetchAllGenres();
      genres.value = responseData;
      print(genres);
    } catch (e) {
      throw Exception('Failed to load genres: $e');
    }
  }

  Future<void> handleLikedGenre() async {
    print("handleLikedGenre");
    print(authController.userModel!.userID!);
    print(selectedGenre);
    try {
      await genreAPI.likedGenre(
          authController.userModel!.userID!, selectedGenre);
      print("Successfully liked Genre(s).");
      Get.offNamed(RouteGenerator.navBar);
    } catch (e) {
      print("Failed to like Genre(s): $e");
      rethrow; // Re-throw the exception to propagate it further if needed
    }
  }
}
