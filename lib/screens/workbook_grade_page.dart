import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/constant/constant.dart';
import 'package:quiz_book/controller/workbook_controller.dart';

class WorkbookGradePage extends StatefulWidget {
  const WorkbookGradePage({super.key});

  @override
  State<WorkbookGradePage> createState() => _WorkbookGradePageState();
}

class _WorkbookGradePageState extends State<WorkbookGradePage> {
  
  bool isChecked = true;

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
                            '${(controller.numCorrect*100/controller.numQuiz).toStringAsFixed(0)}점!',
                            style: const TextStyle(fontSize: 40, fontFamily: 'Cafe24Oneprettynight'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${controller.numCorrect} / ${controller.numQuiz}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                    ));
                  }
                ),
              ),
              GetBuilder<WorkbookController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: controller.isReview ? Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('맞힌 문제는 복습에서 제거하기'),
                        IconButton(
                          splashRadius : 10.0,
                          onPressed: (() {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          }),
                          icon: const Icon(Icons.check),
                          color: isChecked?primaryColor:Colors.grey,
                        )
                      ],
                    ):
                    const Text('틀린 문제는 복습에 추가되었습니다.', textAlign: TextAlign.end,),
                  );
                }
              ),
              Row(
                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GetBuilder<WorkbookController>(
                        builder: (controller) {
                          return ElevatedButton(
                            child: const Text('복습하러 가기'),
                            onPressed: () {
                              if(controller.isReview && isChecked){
                                List<int> newList = [...controller.review];
                                for(int value in controller.correct){
                                  if(controller.correct.contains(value)){
                                    newList.remove(value);
                                    controller.setReview(newList);
                                  }
                                }
                              }
                              controller.initQuiz();
                              controller.setIsReview(true);
                              List<int> quizes = [...controller.review];
                              quizes.shuffle();
                              controller.setNumQuiz(quizes.length);
                              controller.setQuizzes(quizes);
                              Get.offNamed('/workbook/quiz');
                            },
                          );
                        }
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