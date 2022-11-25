import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/constant/constant.dart';
import 'package:quiz_book/models/problem.dart';


class WorkbookController extends GetxController {
  String name = defaultName;
  Rx<Color> color = pallete[0].obs;
  Rx<IconData> icon = iconSet[0].obs;
  List<Problem> problems = [];
  int page = 0;
  int numQuiz = 1;
  int numCorrect = 0;
  List<int> quizzes = [];
  List<int> review = [];
  List<int> correct = [];
  bool isReview = false;

  void setName(String name){
    this.name = name;
  }

  void setColor(Color color){
    this.color.value = color;
  }

  void setIcon(IconData icon){
    this.icon.value = icon;
  }

  void setNumQuiz(int index){
    numQuiz = index;
  }

  void setQuizzes(List<int> quizzes){
    this.quizzes = quizzes;
  }

  void setReview(List<int> review){
    this.review = review;
  }

  void addProblem(Problem problem){
    problems.add(problem);
  }

  void addReview(int index){
    review.add(index);
    update();
  }

  void addCorrect(int index){
    correct.add(index);
  }

  void removeReview(int index){
    review.remove(index);
    update();
  }

  Problem getProblem(int index){
    return problems[index];
  }

  void setProblem(index, Problem problem){
    problems[index] = problem;
  }

  void setIsReview(bool flag){
    isReview = flag;
  }

  void nextPage(){
    page++;
    update();
  }

  void previousPage(){
    if(page > 0){
      page--;
      update();
    }
  }

  void increaseCorrect(){
    numCorrect++;
  }

  void initQuiz(){
    page = 0;
    numCorrect = 0;
    correct = [];
  }

}