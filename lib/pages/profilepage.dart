import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/profile_controller.dart';
import 'package:musicapp/main.dart';
import 'package:musicapp/utils/test_utils.dart';

import '../controller/login_controller.dart';
import '../utils/validation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 27, 32, 44),
                Color.fromARGB(233, 27, 32, 44),
              ],
              stops: [0.1, 1.0],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          )),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 15),
                      child: Row(children: [
                        const CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/3721941/pexels-photo-3721941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                                profileController
                                        .authController.userModel!.userName ??
                                    "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 25),
                  child: ScaleTap(
                    enableFeedback: false,
                    onPressed: () {
                      Get.bottomSheet(
                        SingleChildScrollView(
                          // Wrap your content with SingleChildScrollView
                          child: SizedBox(
                            height: Get.height / 2,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30)),
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 27, 32, 44),
                                    Color.fromARGB(233, 27, 32, 44),
                                  ],
                                  stops: [0.1, 1.0],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 25),
                                        child: Text(
                                          "Edit User",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, top: 25),
                                        child: ScaleTap(
                                          enableFeedback: false,
                                          onPressed: () {
                                            loadingOverlay(context);
                                            profileController.handleEditUser();

                                            Get.back();
                                          },
                                          child: Container(
                                            width: 70,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Center(
                                              child: Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 50),
                                  MyTextField(
                                    controller:
                                        profileController.userNameController,
                                    hintText: "UserName",
                                    obscureText: false,
                                    validator: (val) =>
                                        TextValidation.userNameVali(val),
                                  ),
                                  SizedBox(height: 20),
                                  MyTextField(
                                    controller:
                                        profileController.firstNameController,
                                    hintText: "FirstName",
                                    obscureText: false,
                                    validator: (val) =>
                                        TextValidation.userNameVali(val),
                                  ),
                                  SizedBox(height: 20),
                                  MyTextField(
                                    controller:
                                        profileController.lastnameController,
                                    hintText: "LastName",
                                    obscureText: false,
                                    validator: (val) =>
                                        TextValidation.userNameVali(val),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        "Edit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
