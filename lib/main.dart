import 'package:cpssoft/UI/base/base.dart';
import 'package:cpssoft/UI/home/home.dart';
import 'package:cpssoft/injections/injections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureDependencies(Environment.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Main.base,
      getPages: [
        GetPage(name: Main.base, page: ()=>const Base()),
        GetPage(name: Main.home, page: ()=>const Home()),
      ],
    );
  }
}

class Main {
  static String base = '/';

  static String home = '/home';
}