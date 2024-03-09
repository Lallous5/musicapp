// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int? userID;
  final String? userName;
  final String? email;
  UserModel({
    this.userID,
    this.userName,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'userName': userName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return UserModel(
      userID: map['userID'],
      userName: map['userName'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(userID : $userID,userName: $userName, email: $email)';
  }
}
