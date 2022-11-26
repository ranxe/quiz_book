import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/components/primary_button.dart';
import 'package:quiz_book/components/secondary_button%20.dart';
import 'package:quiz_book/constant/constant.dart';

class NewWorkbookCompletePage extends StatelessWidget {
  const NewWorkbookCompletePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Icon(Icons.check_circle, size: 100.0, color : Colors.green),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Text('문제집 만들기 성공!', style: TextStyle(fontSize: 24, fontFamily: 'Cafe24Oneprettynight'), textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: PrimaryButton(
                  onPressed: () {
                    Get.offNamed('/workbook');
                  },
                  text : '당장 풀러가기'
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SecondaryButton(
                  onPressed: () {
                    Get.offNamed('/');
                  },
                  text : '다음에 풀기'
                ),
              ),
            ],
          )
        ),
    );
  }
}