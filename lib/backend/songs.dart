import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:musicapp/models/artistsModel.dart';
import 'package:musicapp/models/genreModel.dart';
import 'package:musicapp/models/songsModel.dart';

import '../env.dart';

class SongsAPI {
  final String baseUrl = AppEnvironment.baseApiUrl;


  Future<List<SongsModel>> fetchSongsByArtistID(int artistID) async {
    final response =
        await http.get(Uri.parse('$baseUrl/songs/getsongbyartist/$artistID'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body)['result'];
      List<SongsModel> songs = jsonResponse
          .map((json) => SongsModel.fromMap(json))
          .toList(); // Mapping dynamic list to ArtsitModel list
      return songs;
    } else {
      throw Exception('Failed to load Songs');
    }
  }

}
