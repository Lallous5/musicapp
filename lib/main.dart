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
