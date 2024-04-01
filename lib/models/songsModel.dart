import 'dart:convert';

class SongsModel {
  final int? songID;
  final int? artistID;
  final int? genreID;
  final String? songName;
  final String? songImage;
  final String? songFile;
  final String? duration;
  final String? releaseDate;
  final String? addDate;

  SongsModel({
    required this.artistID,
    required this.addDate,
    required this.duration,
    required this.genreID,
    required this.releaseDate,
    required this.songFile,
    required this.songID,
    required this.songImage,
    required this.songName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'artistID': artistID,
      'songID': songID,
      'songName': songName,
      'songImage': songImage,
      'songFile': songFile,
      'releaseDate': releaseDate,
      'genreID': genreID,
      'duration': duration,
      'addDate': addDate,
    };
  }

  factory SongsModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return SongsModel(
      addDate: map['addDate'],
      artistID: map['artistID'],
      duration: map['duration'],
      genreID: map['genreID'],
      releaseDate: map['releaseDate'],
      songFile: map['songFile'],
      songID: map['songID'],
      songImage: map['songImage'],
      songName: map['songName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SongsModel.fromJson(String source) =>
      SongsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SONGS(artistID: $artistID, songID:$songID, songName: $songName,songImage: $songImage,duration: $duration,addDate: $addDate,songFile: $songFile,)';
  }
}
