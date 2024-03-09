import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/pages/explorepage.dart';
import 'package:musicapp/pages/librarypage.dart';
import 'package:musicapp/pages/premiumpage.dart';
import 'package:musicapp/pages/searchpage.dart';

class NavController extends GetxController {
  final itemColor = Color(0xFFA1216F);
  int selectedPage = 0;
  bool isHome = true;
  bool isSearch = false;
  bool isMyEvents = false;
  bool isProfile = false;
  //final Color color;
  @override
  void onInit() {
    super.onInit();
  }

  // final int resetvationsTabIndex;
  final List<Widget> pages = [
    ExplorePage(),
    SearchPage(),
    LibraryPage(),
    PremiumPage(),
  ];

  void navigate(int index, {bool? fromInit}) {
    selectedPage = index;
    if (fromInit != null && !fromInit) update();
  }
}
