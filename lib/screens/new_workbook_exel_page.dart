import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewWorkbookExelPage extends StatelessWidget {
  const NewWorkbookExelPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Get.arguments),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children:  const [
              Text('설명'),
            ],
          )
        ),
    );
  }
}