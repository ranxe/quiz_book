import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/controller/workbook_controller.dart';

class WorkbookGradePage extends StatelessWidget {
  const WorkbookGradePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GetBuilder<WorkbookController>(
                  builder: (controller) {
                    return Container(
                      height: appSize.height/4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color : Colors.white.withOpacity(0.7),
                      ),
                      child: Column(
                        mainAxisAlignment : MainAxisAlignment.center,
                        children: [
                          Text(
                            '${(controller.correct*100/controller.numQuiz).toStringAsFixed(0)}점!',
                            style: const TextStyle(fontSize: 40, fontFamily: 'Cafe24Oneprettynight'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${controller.correct} / ${controller.numQuiz}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                    ));
                  }
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('틀린 문제는 복습에 추가되었습니다.', textAlign: TextAlign.end,),
              ),
              Row(
                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          
                        },
                        child: const Text('복습하러 가기')
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                       padding: const EdgeInsets.all(16.0),
                       child: OutlinedButton(
                         style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 1.0
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('다음에 하기')
                      )  ,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}