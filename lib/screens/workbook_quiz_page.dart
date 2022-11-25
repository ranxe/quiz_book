import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/constant/constant.dart';
import 'package:quiz_book/controller/workbook_controller.dart';
import 'package:quiz_book/models/problem.dart';

class WorkbookQuizPage extends StatefulWidget {
  const WorkbookQuizPage({super.key});

  @override
  State<WorkbookQuizPage> createState() => _WorkbookQuizPageState();
}

class _WorkbookQuizPageState extends State<WorkbookQuizPage> {

  late FocusNode textFieldFocusNode;
  final textFieldController = TextEditingController();
  bool isSolving = true;
  late int problemIndex;
  late Problem currentProblem;
  

  @override
  void initState() {
    super.initState();
    textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;
    return GetBuilder<WorkbookController>(
      builder: (controller) {
        print('current : ${controller.page}');
        problemIndex = controller.quizzes[controller.page];
        currentProblem = controller.problems[controller.quizzes[controller.page]];
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                  child: Container(
                    height: appSize.height/4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color : Colors.white.withOpacity(0.6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Text(currentProblem.question),
                      )
                    )
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 24,
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: '정답을 적어주세요',
                            hintStyle: TextStyle(color: Colors.grey, fontStyle:FontStyle.italic)
                          ),
                          textAlign : TextAlign.center,
                          readOnly: !isSolving,
                          autofocus: true,
                          focusNode: textFieldFocusNode,
                          controller: textFieldController,
                        )
                      ),
                    ),
                    isSolving?Container():                
                      textFieldController.text == currentProblem.answer ? 
                        Image.asset('assets/images/correct_pen.png', height: 40):Image.asset('assets/images/wrong_pen.png', height: 40),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
                  child: ElevatedButton(
                    child: Text(isSolving?'정답확인':
                      controller.page +1 != controller.numQuiz? '다음문제' : '결과보기'),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                       if(isSolving){
                          setState(() {
                            isSolving=false;
                          });
                          if(textFieldController.text != currentProblem.answer){
                            if(!controller.review.contains(problemIndex)){
                              controller.addReview(problemIndex);
                            }
                          }else{
                            controller.increaseCorrect();
                          }
                        }else{
                          if(controller.page +1 != controller.numQuiz){
                              textFieldFocusNode.requestFocus();
                              setState(() {
                                isSolving=true;
                                textFieldController.text = '';
                              });
                              controller.nextPage();
                          }else{
                            Get.offNamed('/workbook/grade');
                          }
                        }
                    },
                  ),
                ),
                isSolving && currentProblem.answer != textFieldController.text ?Container():
                Text(currentProblem.answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.pink,
                    fontSize: 24,
                    fontFamily: 'Cafe24Oneprettynight',
                    fontStyle : FontStyle.italic
                  ),
                )
              ],
            )
        );
      }
    );
  }
}