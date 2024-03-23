import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get/get.dart';

import 'controller/nav_controller.dart';

class BottomNavigationBarController extends StatefulWidget {
  final int? pageIndex;
  BottomNavigationBarController({Key? key, this.pageIndex}) : super(key: key);

  @override
  State<BottomNavigationBarController> createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final navCon = Get.put(NavController(), permanent: true);

  @override
  void initState() {
    super.initState();
    navCon.isHome = true;
    navCon.isProfile = false;

    widget.pageIndex == 2
        ? setState(() {
            navCon.navigate(2);
            navCon.isHome = false;
            navCon.isSearch = false;
            navCon.isMyEvents = true;
            navCon.isProfile = false;
            print("setting nav bar");
          })
        : navCon.navigate(widget.pageIndex ?? 0, fromInit: true);

    setState(() {});
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 2, bottom: 2),
          child: Container(
            height: 60,
            child: Material(
              color: Color.fromARGB(38, 122, 122, 122),
              elevation: 10,
              borderRadius: BorderRadius.circular(11),
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 27, 32, 44),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScaleTap(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            navCon.isHome = true;
                            navCon.isSearch = false;
                            navCon.isMyEvents = false;
                            navCon.isProfile = false;
                          });
                          navCon.navigate(0);
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 55,
                          width: Get.width * 0.2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                !navCon.isHome
                                    ? Icon(
                                        Icons.music_note_outlined,
                                      )
                                    : Icon(
                                        Icons.music_note_rounded,
                                        color: Colors.green.withOpacity(0.8),
                                        size: 35,
                                      ),
                              ]),
                        ),
                      ),
                      ScaleTap(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            navCon.isHome = false;
                            navCon.isSearch = true;
                            navCon.isMyEvents = false;
                            navCon.isProfile = false;
                          });
                          navCon.navigate(1);
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 55,
                          width: Get.width * 0.2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                !navCon.isSearch
                                    ? Icon(
                                        Icons.search_outlined,
                                        size: 26,
                                      )
                                    : Icon(
                                        Icons.search_rounded,
                                        color: Colors.green.withOpacity(0.8),
                                        size: 35,
                                      ),
                              ]),
                        ),
                      ),
                      ScaleTap(
                          enableFeedback: false,
                          onPressed: () {
                            setState(() {
                              navCon.isHome = false;
                              navCon.isSearch = false;
                              navCon.isMyEvents = true;
                              navCon.isProfile = false;
                            });
                            navCon.navigate(2);
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 55,
                            width: Get.width * 0.2,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  !navCon.isMyEvents
                                      ? Icon(
                                          Icons.library_music_outlined,
                                          size: 26,
                                        )
                                      : Icon(
                                          Icons.library_music_rounded,
                                          color: Colors.green.withOpacity(0.8),
                                          size: 35,
                                        ),
                                ]),
                          )),
                      ScaleTap(
                        enableFeedback: false,
                        onPressed: () {
                          setState(() {
                            navCon.isHome = false;
                            navCon.isSearch = false;
                            navCon.isMyEvents = false;
                            navCon.isProfile = true;
                          });
                          navCon.navigate(3);
                        },
                        child: Container(
                            color: Colors.transparent,
                            height: 55,
                            width: Get.width * 0.2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                navCon.isProfile
                                    ? Icon(
                                        Icons.person_rounded,
                                        size: 35,
                                        color: Colors.green.withOpacity(0.8),
                                      )
                                    : Icon(
                                        Icons.person_outline,
                                        size: 26,
                                      ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: GetBuilder<NavController>(
          builder: (controller) {
            return IndexedStack(
              children: controller.pages,
              index: controller.selectedPage,
            );
          },
        ),
      ),
    );
  }
}
