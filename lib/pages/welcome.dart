// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/controller/login_controller.dart';
import '../utils/buttons.dart';
import '../utils/square_tile.dart';
import '../utils/test_utils.dart';
import '../utils/validation.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  AUTHController loginController = Get.put(AUTHController());

  final _formKey = GlobalKey<FormState>();

  // sign user in method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                'https://images.pexels.com/photos/3721941/pexels-photo-3721941.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              const Text("Hi !",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRect(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),

                      width: MediaQuery.of(context).size.width * 0.9,
                      // height: MediaQuery.of(context).size.height * 0.63,
                      child: Form(
                        key: _formKey,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // username textfield
                                MyTextField(
                                  validator: (val) =>
                                      TextValidation.emailValidation(val),
                                  controller: loginController.emailController,
                                  hintText: 'Email',
                                  obscureText: false,
                                ),

                                const SizedBox(height: 10),

                                // sign in button
                                MyButton(
                                  onTap: (() {
                                    if (_formKey.currentState!.validate()) {
                                      loginController.handleCheckEmail();
                                      loginController.setEmail(
                                          loginController.emailController.text);
                                    } else {
                                      if (kDebugMode) {
                                        print('not valid');
                                      }
                                    }
                                  }),
                                ),

                                const SizedBox(height: 10),

                                // or continue with
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        'Or',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.5,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                // google + apple sign in buttons
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      // google button
                                      SquareTile(
                                        imagePath: 'assets/icons/google.png',
                                        title: "Continue with Google",
                                      ),

                                      SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
