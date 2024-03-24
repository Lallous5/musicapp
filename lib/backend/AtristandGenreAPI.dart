import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musicapp/models/artistsModel.dart';
import 'package:musicapp/models/genreModel.dart';

import '../env.dart';

class AtristandGenreAPI {
  final String baseUrl = AppEnvironment.baseApiUrl;

  Future<List<ArtsitModel>> fetchAllArtists() async {
    final response = await http.get(Uri.parse('$baseUrl/artists/get_all'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['result'];
      List<ArtsitModel> artists = jsonResponse
          .map((json) => ArtsitModel.fromMap(json))
          .toList(); // Mapping dynamic list to ArtsitModel list
      return artists;
    } else {
      throw Exception('Failed to load artists');
    }
  }

  Future<List<ArtsitModel>> fetchLikedArtistsByUser(int userID) async {
    final response =
        await http.get(Uri.parse('$baseUrl/artist/getLikedartist/$userID'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['result'];
      List<ArtsitModel> artists = jsonResponse
          .map((json) => ArtsitModel.fromMap(json))
          .toList(); // Mapping dynamic list to ArtsitModel list
      return artists;
    } else {
      throw Exception('Failed to load Liked artists');
    }
  }

  Future<List<GenretModel>> fetchAllGenres() async {
    final response = await http.get(Uri.parse('$baseUrl/genre/get_all'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['result'];
      List<GenretModel> genres = jsonResponse
          .map((json) => GenretModel.fromMap(json))
          .toList(); // Mapping dynamic list to ArtsitModel list
      return genres;
    } else {
      throw Exception('Failed to load genres');
    }
  }

  Future<List<GenretModel>> fetchLikedGenresByUser(int userID) async {
    final response =
        await http.get(Uri.parse('$baseUrl/genre/getLikedgenre/$userID'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['result'];
      List<GenretModel> genres = jsonResponse
          .map((json) => GenretModel.fromMap(json))
          .toList(); // Mapping dynamic list to ArtsitModel list
      return genres;
    } else {
      throw Exception('Failed to load Liked genres');
    }
  }

  Future likedArtist(List<int> artistID, int userID) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/likedArtist'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, dynamic>{'userID': '$userID', 'artistID': artistID}),
    );

    if (response.statusCode == 200) {
      print("success");
    } else {
      print("bad request");
    }
  }

  Future likedGenre(int userID, List<int> genresID) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/user/likedGenre'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{'userID': '$userID', 'genreID': genresID},
        ),
      );

      if (response.statusCode == 200) {
        print("success");
      } else {
        print("bad request");
      }
    } catch (e) {
      print("Failed to like Genre(s): $e");
      rethrow; // Re-throw the exception to propagate it further if needed
    }
  }
}
