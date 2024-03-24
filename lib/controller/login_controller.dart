import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/backend/auth.dart';
import 'package:musicapp/env.dart';
import 'package:musicapp/main.dart';

import '../models/persons.dart';
import '../rout.dart';
import '../utils/constantComponent.dart';

class AUTHController extends GetxController {
  String basicUrl = AppEnvironment.baseApiUrl;
  AuthBACKEND auth = AuthBACKEND();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  Rx<UserModel?> rxUserModel = Rxn();

  @override
  void onInit() {
    print(basicUrl);
    super.onInit();
  }

  String email = '';

  void setEmail(String newEmail) {
    email = newEmail;
    update(); // This is to notify the listeners (like UI) about the change.
  }

  UserModel? get userModel => rxUserModel.value;
  set setUserModel(UserModel user) {
    rxUserModel.value = user;
  }

  void handleCheckEmail() async {
    print("check email");
    String email = emailController.text.trim();

    try {
      UserModel user = await auth.checkEmail(email);
      setUserModel = user;
      userModel.toString();
      Get.toNamed(RouteGenerator.loginPage);
      print(rxUserModel);
    } catch (e) {
      // Handle any exceptions, such as invalid email
      print('Error: $e');
      // Navigate to the new password page
    }
  }

  Future handleCheckPass() async {
    try {
      await auth.checkPass(userModel!.userID as int, passwordController.text);
      // If email is valid, you can proceed with the login process using the returned user ID

      Get.toNamed(RouteGenerator.navBar);
      // Navigate to the appropriate page based on the response
    } catch (e) {
      // Handle any exceptions, such as invalid email
      print('Error: $e');
      // Navigate to the new password page
      Get.snackbar("error", "$e");
    }
  }

  Future handleRegister() async {
    String userName = userNameController.text.trim();

    try {
      await auth.createUser(email, passwordController.text, userName);
      // If email is valid, you can proceed with the login process using the returned user ID

      Get.toNamed(RouteGenerator.artist);
      // Navigate to the appropriate page based on the response
    } catch (e) {
      // Handle any exceptions, such as invalid email
      print('Error: $e');
      // Navigate to the new password page
      Get.snackbar("error", "$e");
    }
  }
}
