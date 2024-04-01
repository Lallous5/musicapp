import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:musicapp/rout.dart';

import '../env.dart';
import '../models/persons.dart';
import '../models/tokenModel.dart';

class AuthBACKEND {
  final String baseUrl = AppEnvironment.baseApiUrl;

  Future<UserModel> checkEmail(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/checkEmail'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> existingEmailList = data['result']['existingEmail'];
      final Map<String, dynamic> existingEmail =
          existingEmailList.isNotEmpty ? existingEmailList.first : {};

      if (existingEmail.isNotEmpty) {
        // If email is valid, return the user information
        return UserModel.fromMap(existingEmail);
      } else {
        throw Exception('No user found with this email');
      }
    } else if (response.statusCode == 500) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      Get.toNamed(RouteGenerator.registerPager);
      print(data);
      // If email is not valid, you can navigate to the new password page
      throw Exception('Invalid email. Navigate to new password page.');
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to check email');
    }
  }

  Future checkPass(int userID, String pass) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login/checkPassword'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'userID': '$userID', 'password': pass}),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      print(responseBody);
      return TokenModel.fromMap(responseBody);
    } else {
      print("go to signup");
    }
  }

  Future<void> createUser(
      String email, String password, String userName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signUp/createUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'userName': userName,
      }),
    );

    if (response.statusCode == 200) {
      print("success");
    } else {
      print("go to signup");
    }
  }

  Future<void> editUser(
      int userID, String userName, String firstName, String lastName) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/user/updateUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'userID': "$userID",
        'userName': userName,
        'firstname': firstName,
        'lastname': lastName,
      }),
    );

    if (response.statusCode == 200) {
      print("success");
    } else {
      print("go to signup");
    }
  }
}
