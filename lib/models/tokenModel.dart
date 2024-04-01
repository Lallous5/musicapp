// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TokenModel {
  final bool? success;
  final String? message;
  final String? token;

  TokenModel({
    this.token,
    this.message,
    this.success,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'message': message,
      'success': success,
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return TokenModel(
      token: map['token'],
      success: map['success'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Token(token: $token, message:$message, success: $success)';
  }
}
