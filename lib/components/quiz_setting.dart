import 'package:flutter/material.dart';
import 'package:get/get.dart';
class QuizSetting extends StatelessWidget {
  const QuizSetting({
    Key? key,
    required this.numQuiz,
    required this.numProblems,
    required this.onNumQuizChange,
    required this.onPressed,

  }) : super(key: key);

  
  final int numQuiz;
  final int numProblems;
  final Function onNumQuizChange;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
                  controller: TextEditingController()..text = numQuiz.toString(),
                  onChanged: (value) {
                    onNumQuizChange(value);
                  },
                ),
              ),
              Text(' / $numProblems'),
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
                    if(value.isNotEmpty){
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
            onPressed();
          },
          child: const Text('GO !'),
        ),
      ],
    );
  }
}