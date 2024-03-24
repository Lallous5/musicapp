import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/login_controller.dart';

import '../backend/auth.dart';
import '../models/persons.dart';

class ProfileController extends GetxController {
  AuthBACKEND auth = AuthBACKEND();
  AUTHController authController = Get.find();
  final firstNameController = TextEditingController();
  final userNameController = TextEditingController();
  final lastnameController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    firstNameController.text = authController.userModel!.firstName ?? "";
    lastnameController.text = authController.userModel!.lastName ?? "";
    userNameController.text = authController.userModel!.userName ?? "";
    super.onInit();
  }

  Future handleEditUser() async {
    try {
      await auth.editUser(
          authController.userModel!.userID as int,
          userNameController.text,
          firstNameController.text,
          lastnameController.text);
      // If email is valid, you can proceed with the login process using the returned user ID
      Get.back();
      update();
      // Navigate to the appropriate page based on the response
    } catch (e) {
      // Handle any exceptions, such as invalid email
      print('Error: $e');
      // Navigate to the new password page
      Get.snackbar("error", "$e");
    }
  }
}
