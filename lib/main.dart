import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/constant/constant.dart';
import 'package:quiz_book/screens/new_workbook_complete_page.dart';
import 'package:quiz_book/screens/new_workbook_exel_page.dart';
import 'package:quiz_book/screens/new_workbook_page.dart';
import 'package:quiz_book/screens/new_workbook_simple_page.dart';
import 'package:quiz_book/screens/solve_workbook_page.dart';
import 'package:quiz_book/screens/workbook_menu_page.dart';
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
      // home: const HomePage(),
      defaultTransition: Transition.fadeIn,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page:() => const HomePage()),
        GetPage(name: '/new', page: (() => const NewWorkbookPage())),
        GetPage(name: '/new/simple', page: (() => const NewWorkbookSimplePage())),
        GetPage(name: '/new/exel', page: (() => const NewWorkbookExelPage())),
        GetPage(name: '/new/complete', page: (() => const NewWorkbookCompletePage())),
        GetPage(name: '/workbook', page: (() => const WorkbookMenuPage())),
        GetPage(name: '/workbook/solve', page: (() => const SolveWorkbookPage()))
      ],
    );
  }
}