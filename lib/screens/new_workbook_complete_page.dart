import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                child: ElevatedButton(
                  onPressed: () {
                    Get.offNamed('/workbook');
                  },
                  child: const Text('당장 풀러가기')
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 1.0
                  ),
                  onPressed: () {
                    Get.offNamed('/');
                  },
                  child: const Text('다음에 풀기')
                ),
              ),
            ],
          )
        ),
    );
  }
}