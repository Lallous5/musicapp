// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final int? userID;
  final String? userName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  UserModel({
    this.userID,
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return UserModel(
      userID: map['userID'],
      userName: map['userName'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(userID : $userID,userName: $userName, email: $email, firstName: $firstName, lastName:$lastName)';
  }
}
