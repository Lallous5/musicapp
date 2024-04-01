import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/env.dart';
import 'package:musicapp/pages/welcome.dart';
import 'package:musicapp/rout.dart';
import 'package:musicapp/utils/constantComponent.dart';

late BuildContext dialogContext;

/** Top level function to show a loading indicator overlay anywhere in app,
 * call Navigator.of([dialogContext].pop() to close
 **/

void loadingOverlay(context) {
  if (kDebugMode) {
    print('loading..');
  }
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (bldr) {
        dialogContext = bldr;
        return ConstantComponentsUI.loadingIndicator;
      });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner:
          AppEnvironment.environment == Environment.dev ? true : false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppEnvironment.environment == Environment.dev
                ? Colors.green
                : Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteGenerator.welcomePage,
      getPages: RouteGenerator.routes,
      home: WelcomePage(),
    );
  }
}



// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:musicapp/env.dart';
// import 'package:musicapp/pages/welcome.dart';
// import 'package:musicapp/rout.dart';
// import 'package:musicapp/utils/constantComponent.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'models/tokenModel.dart';

// late BuildContext dialogContext;

// /** Top level function to show a loading indicator overlay anywhere in app,
//  * call Navigator.of([dialogContext].pop() to close
//  **/

// void loadingOverlay(context) {
//   if (kDebugMode) {
//     print('loading..');
//   }
//   showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (bldr) {
//         dialogContext = bldr;
//         return ConstantComponentsUI.loadingIndicator;
//       });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<TokenModel?>(
//       future: getTokenFromSharedPreferences(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show loading indicator while checking token
//           return CircularProgressIndicator();
//         } else {
//           if (snapshot.hasData && snapshot.data != null) {
//             // Token exists and is valid, navigate to main screen
//             return GetMaterialApp(
//               title: 'MusicApp',
//               debugShowCheckedModeBanner:
//                   AppEnvironment.environment == Environment.dev ? true : false,
//               theme: ThemeData(
//                 colorScheme: ColorScheme.fromSeed(
//                   seedColor: AppEnvironment.environment == Environment.dev
//                       ? Colors.green
//                       : Colors.deepPurple,
//                 ),
//                 useMaterial3: true,
//               ),
//               initialRoute: RouteGenerator.navBar,
//               getPages: RouteGenerator.routes,
//             );
//           } else {
//             // No valid token found, navigate to welcome page
//             return GetMaterialApp(
//               title: 'MusicApp',
//               debugShowCheckedModeBanner:
//                   AppEnvironment.environment == Environment.dev ? true : false,
//               theme: ThemeData(
//                 colorScheme: ColorScheme.fromSeed(
//                   seedColor: AppEnvironment.environment == Environment.dev
//                       ? Colors.green
//                       : Colors.deepPurple,
//                 ),
//                 useMaterial3: true,
//               ),
//               initialRoute: RouteGenerator.welcomePage,
//               getPages: RouteGenerator.routes,
//             );
//           }
//         }
//       },
//     );
//   }

//   // Function to get token from shared preferences
//   Future<TokenModel?> getTokenFromSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//     // You might need to verify token validity here
//     return token != null ? TokenModel(token: token) : null;
//   }
// }
