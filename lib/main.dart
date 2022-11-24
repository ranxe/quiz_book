import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/constant/constant.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        // fontFamily: 'Cafe24Oneprettynight',
        canvasColor: Colors.green.shade100,
        primarySwatch: primaryColor,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor : Colors.black26,
          elevation : 2,
        )
      ),
      home: const HomePage(),
    );
  }
}