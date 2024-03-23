// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ArtsitModel {
  final int? artistID;
  final String? about;
  final String? artistsName;
  final String? artistImage;

  ArtsitModel({
    this.artistID,
    this.about,
    this.artistsName,
    this.artistImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'artistID': artistID,
      'about': about,
      'artistsName': artistsName,
      'artistImage': artistImage,
    };
  }

  factory ArtsitModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return ArtsitModel(
      artistID: map['artistID'],
      about: map['about'],
      artistsName: map['artistsName'],
      artistImage: map['artistImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ArtsitModel.fromJson(String source) =>
      ArtsitModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(artistID : $artistID,about: $about, artistsName: $artistsName, artistImage:$artistImage)';
  }
}
