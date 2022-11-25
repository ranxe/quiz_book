import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  child: ElevatedButton(
                    onPressed: () {
                      controller.initPage();
                      Get.dialog(
                        AlertDialog(
                          title : const Icon(Icons.settings, color : Colors.grey),
                          content : 
                          Column(
                            mainAxisSize : MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('문제 수 :', textAlign: TextAlign.end,),
                                  SizedBox(
                                    width: 40,
                                    height: 24,
                                    child:
                                      TextField(
                                      keyboardType : TextInputType.number,
                                      textAlign : TextAlign.center,
                                      controller: TextEditingController()..text = controller.numQuiz.toString(),
                                      onChanged: (value) {
                                        if(value.isNotEmpty && value.isNum){
                                          controller.setNumQuiz(int.parse(value));
                                        }
                                      },
                                    ),
                                  ),
                                  Text(' / ${controller.problems.length}'),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('제한 시간 :', style: TextStyle(color: Colors.grey)),
                                  SizedBox(
                                    width: 40,
                                    height: 24,
                                    child: TextField(
                                      keyboardType : TextInputType.number,
                                      textAlign : TextAlign.center,
                                      readOnly : true,
                                      onChanged: (value) {
                                        if(value.isNotEmpty && value.isNum){
                                        }
                                      },
                                    ),
                                  ),
                                  const Text('초', style: TextStyle(color: Colors.grey))
                                ],
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            ElevatedButton(
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
                                  Get.offNamed('/workbook/solve');
                                }
                              },
                              child: const Text('GO !'),
                            ),
                          ],
                        )
                      );
                    },
                    child: const Text('문제 풀기')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text('복습 하기')),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16, 24, 16),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 1.0
                    ),
                    onPressed: () {},
                    child: const Text('문제 수정')
                  ),
                ),
              ],
            ),
        );
      }
    );
  }
}