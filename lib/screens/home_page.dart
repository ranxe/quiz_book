import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/controller/workbook_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    Get.put(WorkbookController());
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body : Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 8.0),
        child: Row(
          mainAxisAlignment : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize : MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style : ElevatedButton.styleFrom(
                      backgroundColor : Colors.white
                    ),
                    onPressed: () {
                      Get.toNamed('/workbook');
                    },
                    child: const SizedBox(
                      width: 120,
                      height: 180,
                      child: Icon(
                        Icons.abc,
                        color : Colors.grey,
                        size : 64
                      ), 
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('단어장'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize : MainAxisSize.min,
                children: [
                  OutlinedButton(
                    style : ElevatedButton.styleFrom(
                      backgroundColor : Colors.white
                    ),
                    onPressed: () {
                      Get.toNamed('/new');
                    },
                    child: const SizedBox(
                      width: 120,
                      height: 180,
                      child: Icon(
                        Icons.add,
                        color : Colors.grey,
                        size : 64
                      ), 
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}