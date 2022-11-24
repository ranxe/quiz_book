import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page.dart';
import 'dart:async';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children:  [
               Column(
                 children: [
                   Stack(
                     children: [
                       Image.asset('assets/images/circle_pen.png'),
                       const Positioned(
                         top: 20,
                         bottom: 0,
                         left: 0,
                         right: 0,
                         child: Center(
                          child: Text('문제풀기 좋은 날', style : TextStyle(fontFamily: 'Cafe24Oneprettynight', fontSize : 30)),
                        ),
                       )
                     ],
                   ),
                 ],
               ),
              const Text('그래, 문제 풀자!')
            ],
          )
        ),
    );
  }
}

