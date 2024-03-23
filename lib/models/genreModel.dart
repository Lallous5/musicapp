// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GenretModel {
  final int? genreID;
  final String? genreType;

  GenretModel({
    this.genreID,
    this.genreType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'genreID': genreID,
      'genreType': genreType,
    };
  }

  factory GenretModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return GenretModel(
      genreID: map['genreID'],
      genreType: map['genreType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GenretModel.fromJson(String source) =>
      GenretModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(genreID : $genreID,genreType: $genreType)';
  }
}
