import 'package:flutter/material.dart';
import 'env.dart';
import 'main.dart';

void main() {
  AppEnvironment.setupEnv(Environment.prod);

  runApp(MyApp());
}
