import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/constant/constant.dart';
import 'package:quiz_book/controller/workbook_controller.dart';
import 'package:quiz_book/models/problem.dart';

class SolveWorkbookPage extends StatelessWidget {
  SolveWorkbookPage({super.key});
  final _formKey = GlobalKey<FormState>();
  
  bool isSolving = true;
  String userAnswer = '';

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    return GetBuilder<WorkbookController>(
      builder: (controller) {
        int problemIndex = controller.quizzes[controller.page];
        Problem currentProblem = controller.problems[controller.quizzes[controller.page]];
        print(currentProblem.hint);
        return Scaffold(
            appBar: AppBar(
              title: Text('${controller.page + 1}/${controller.numQuiz}'),
              backgroundColor: Colors.grey.withOpacity(0.9),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment  : MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${controller.page + 1}.', style: const TextStyle(fontSize: 16),),
                      Row(
                        children: [
                          currentProblem.hint!.isNotEmpty?
                          IconButton(
                            splashRadius : 32.0,
                            color: primaryColor,
                            icon: const Icon(Icons.lightbulb_circle, size: 32),
                            onPressed: () {
                              Get.defaultDialog(title: "힌트", content: SingleChildScrollView(child: Text(currentProblem.hint??'')));
                            },
                          ):Container(),
                          IconButton(
                            splashRadius : 16.0,
                            icon: Icon(
                              controller.review.contains(problemIndex) ? Icons.bookmark : Icons.bookmark_add_outlined,
                              size: 32.0,
                              color: controller.review.contains(problemIndex) ? primaryColor : Colors.grey,
                            ),
                            onPressed: () {
                              String snackMessage = '복습에 추가하였습니다';
                              if(controller.review.contains(problemIndex)){
                                controller.removeReview(problemIndex);
                                snackMessage = '복습에서 제외하였습니다.';
                              }else{
                                controller.addReview(problemIndex);
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(snackMessage, textAlign: TextAlign.center,),
                                  duration: const Duration(milliseconds: 1500),
                                )
                              );
                            },
                          ),
                        ],
                      ),                      
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                  child: Container(
                    color : Colors.white.withOpacity(0.6),
                    height: appSize.height/4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Text(currentProblem.question),
                      )
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 24,
                    child: Form(
                      key : _formKey,
                      child: TextFormField(
                        decoration: const InputDecoration(
                        hintText: '정답을 적어주세요',
                        hintStyle: TextStyle(color: Colors.grey, fontStyle:FontStyle.italic)
                      ),
                        textAlign : TextAlign.center,
                        onChanged: (value) {
                          userAnswer = value;
                        },
                        validator: (value) {
                          if(value != currentProblem.answer){
                            currentProblem.answer;
                          }
                        },
                      ),
                    )
                    //isSolving 이 false면 readOnly
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text(isSolving?'정답확인':'다음문제'),
                    onPressed: () {
                       if(isSolving){
                          isSolving=false;
                          //isSolving은 controller에서 관리해야할 것 같다.
                          //문제 체점해서 틀렸으면 review에 add
                          //정답 및 해설을 볼 수 있도록 키보드도 자동으로 내리기.
                        }else{
                          isSolving=true;
                          //page ++
                        }
                    },
                  ),
                ),
                isSolving?Container():
                Text(currentProblem.answer)
              ],
            )
        );
      }
    );
  }
}