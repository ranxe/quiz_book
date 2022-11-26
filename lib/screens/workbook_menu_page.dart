import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/components/primary_button.dart';
import 'package:quiz_book/components/quiz_setting.dart';
import 'package:quiz_book/components/secondary_button%20.dart';
import 'package:quiz_book/constant/constant.dart';
import 'package:quiz_book/controller/workbook_controller.dart';

class WorkbookMenuPage extends StatelessWidget {
  const WorkbookMenuPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkbookController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: Text(controller.name),
              backgroundColor: Colors.grey.withOpacity(0.9),
            ),
            backgroundColor : controller.color.value.withOpacity(0.9),
            body: Column(
              mainAxisAlignment : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 40.0),
                  child: Icon(
                    controller.icon.value,
                    size: 100.0,
                    color : darkColor.contains(controller.color.value) ? Colors.white : Colors.grey
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16, 24, 16),
                  child: PrimaryButton(
                    text: '문제 풀기',
                    onPressed: () {
                      controller.initQuiz();
                      controller.setIsReview(true);
                      Get.dialog(
                        QuizSetting(
                          numProblems: controller.problems.length,
                          numQuiz: controller.numQuiz,
                          onNumQuizChange: (String value){
                            if(value.isNotEmpty){
                              controller.setNumQuiz(int.tryParse(value) ?? 1);
                            }
                          },
                          onPressed: () {
                            int numQuiz = controller.numQuiz;
                            int numProblems = controller.problems.length;

                            if(numQuiz == 0){
                              numQuiz = numProblems;
                            }

                            if(numQuiz >= 0 && numQuiz <= numProblems) {
                              var quizes = List<int>.generate(numProblems, (i) => i);
                              quizes.shuffle();
                              controller.setQuizzes(quizes.sublist(0,numQuiz));
                              Get.offNamed('/workbook/quiz');
                            }
                          }
                        )
                      );
                    },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: PrimaryButton(
                    text: '복습 하기',
                    onPressed: (){
                      controller.initQuiz();
                      controller.setIsReview(true);
                      Get.dialog(
                        QuizSetting(
                          numProblems: controller.review.length,
                          numQuiz: controller.numQuiz,
                          onNumQuizChange: (value){
                            if(value.isNotEmpty){
                            controller.setNumQuiz(int.tryParse(value) ?? 1);
                            }
                          },
                          onPressed: () {
                            int numQuiz = controller.numQuiz;
                            int numReview = controller.review.length;

                            if(numQuiz == 0){
                              numQuiz = numReview;
                            }

                            if(numQuiz >= 0 && numQuiz <= numReview) {
                              List<int> quizes = controller.review;
                              quizes.shuffle();
                              controller.setQuizzes(quizes.sublist(0, numQuiz));
                              Get.offNamed('/workbook/quiz');
                            }
                          }
                        )
                      );
                    },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16, 24, 16),
                  child: SecondaryButton(
                    onPressed: () {},
                    text: '문제 수정'
                  ),
                ),
              ],
            ),
        );
      }
    );
  }
}