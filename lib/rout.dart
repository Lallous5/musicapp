// ignore_for_file: unnecessary_type_check

import 'package:get/get.dart';
import 'package:musicapp/pages/loginpage.dart';
import 'package:musicapp/pages/signup.dart';
import 'package:musicapp/pages/welcome.dart';

import 'navBar.dart';

class RouteGenerator {
  static const String welcomePage = '/';
  static const String loginPage = "/loginPage";
  static const String registerPager = "/registerPager";
  static const String navBar = "/navBar";

  static String getWelcomePage() => welcomePage;
  static String getLoginPage() => loginPage;
  static String getRegisterPage() => registerPager;
    static String getNavBar() => navBar;

  static List<GetPage> routes = [
    GetPage(
      name: welcomePage,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: registerPager,
      page: () => Signup(),
    ),
    GetPage(
      name: navBar,
      page: () => BottomNavigationBarController(),
    ),
  ];
}
