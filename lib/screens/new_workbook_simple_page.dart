import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/controller/workbook_controller.dart';
import 'package:quiz_book/models/problem.dart';
import 'package:quiz_book/screens/new_workbook_complete_page.dart';

class NewWorkbookSimplePage extends StatefulWidget {
  const NewWorkbookSimplePage({super.key});

  @override
  State<NewWorkbookSimplePage> createState() => _NewWorkbookSimplePageState();
}

class _NewWorkbookSimplePageState extends State<NewWorkbookSimplePage> {
  final _formKey = GlobalKey<FormState>();

  int id = 0;
  String question = '';
  String? picture = '';
  String answer = '';
  String? hint = '';

  SnackBar shwoSaveSnackbar() {
    return const SnackBar(
      content: Text('저장했습니다.', textAlign: TextAlign.center),
      duration: Duration(milliseconds: 1500)
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,   
      appBar: AppBar(
        title: GetBuilder<WorkbookController>(
          builder: (controller) {
            return Text(Get.arguments + ' ${controller.page+ 1}번');
          }
        ),
      ),
      body: Padding(
        padding : const EdgeInsets.all(8.0),
        child: GetBuilder<WorkbookController>(
          builder: (controller) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField (
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        alignLabelWithHint : true,
                        labelText: '문제 입력*',
                      ),
                      maxLines : 5,
                      controller: TextEditingController()..text = controller.page < controller.problems.length ? controller.problems[controller.page].question : '',
                      onChanged: (value) => {
                        question = value
                      },
                      validator : (value) {
                        if (value == '' || value![0] == ' ') {
                          return '문제를 적어주세요!';
                        }
                        return null;
                      }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 1.0
                      ),
                      onPressed: () {},
                      child: const Text('이미지 추가')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField (
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '정답 입력*',
                      ),
                      controller: TextEditingController()..text = controller.page < controller.problems.length ? controller.problems[controller.page].answer : '',
                      onChanged: (value) => {
                        answer = value
                      },
                      validator: (value) {
                        if (value == '' || value![0] == ' ') {
                          return '정답을 적어주세요!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField (
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '힌트 입력',
                      ) ,
                      controller: TextEditingController()..text = controller.page < controller.problems.length ? controller.problems[controller.page].hint??'' : '',
                      onChanged: (value) => {
                        hint = value
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 8.0),
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        controller.page != 0 ? ElevatedButton(
                          onPressed: () {
                            controller.previousPage();
                            _formKey.currentState?.reset();
                            setState(() {
                              Problem nextProblem = controller.problems[controller.page];
                              id = controller.page;
                              question = nextProblem.question;
                              picture = nextProblem.picture;
                              answer = nextProblem.answer;
                              hint = nextProblem.hint;
                            });
                          },
                          child: const Icon(Icons.arrow_back)
                        ) : OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 1.0
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.arrow_back)
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              FocusScope.of(context).unfocus();
                              if(controller.page == controller.problems.length){
                                Problem problem = Problem(id: 0, workbookId: controller.page, isReview: false, question: question, answer: answer, hint: hint);
                                controller.addProblem(problem);
                              } else if(controller.page < controller.problems.length){
                                 Problem problem = Problem(id: 0, workbookId: controller.page, isReview: false, question: question, answer: answer, hint: hint);
                                 controller.setProblem(controller.page, problem);
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                shwoSaveSnackbar()
                              );
                            }
                          },
                          child: const Text("저장")
                        ),
                        controller.page +1 < controller.problems.length ?
                        ElevatedButton(
                          onPressed: () {
                            controller.nextPage();
                            setState(() {
                              Problem nextProblem = controller.problems[controller.page];
                              id = controller.page;
                              question = nextProblem.question;
                              picture = nextProblem.picture;
                              answer = nextProblem.answer;
                              hint = nextProblem.hint;
                            });
                            _formKey.currentState?.reset();
                          },
                          child: const Icon(Icons.arrow_forward)
                        ) : OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                elevation: 1.0
                              ),
                              onPressed: () {
                                if(controller.page + 1 == controller.problems.length){  
                                  controller.nextPage();
                                  _formKey.currentState?.reset();
                                }else if(controller.page == controller.problems.length){
                                  if(_formKey.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    Problem problem = Problem(id: 0, workbookId: controller.page, isReview: false, question: question, answer: answer, hint: hint);
                                    controller.addProblem(problem);
                                    controller.nextPage();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      shwoSaveSnackbar()
                                    );
                                  }
                                }
                              },
                              child: const Icon(Icons.add)
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal : 8.0),
                    child: ElevatedButton(
                          onPressed: () {
                            if (controller.problems.isNotEmpty) {
                              Get.off(()=>const NewWorkbookCompletePage(), transition: Transition.fadeIn);
                            }
                          },
                          child: const Text('문제지 완성')
                    ),
                  )
                ],
              ),
            );
          }
        )
      ),
    );
  }
}