import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_book/components/color_selector.dart';
import 'package:quiz_book/components/primary_button.dart';
import 'package:quiz_book/components/secondary_button%20.dart';
import 'package:quiz_book/constant/constant.dart';
import 'package:quiz_book/controller/workbook_controller.dart';

class NewWorkbookPage extends StatefulWidget {
  const NewWorkbookPage({super.key});
  
   @override
  State<NewWorkbookPage> createState() => _NewWorkbookPageState();
}


class _NewWorkbookPageState extends State<NewWorkbookPage> {

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  
  Widget iconSelectButton(IconData icon){
    
  final controller = Get.find<WorkbookController>();
    return  IconButton(
        onPressed: (){
         controller.setIcon(icon);
          Navigator.pop(context);
        },
        icon: Icon(icon , color : Colors.grey)
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment : MainAxisAlignment.center,
            children:  [
              GetX<WorkbookController>(
                builder: (controller) {
                  return OutlinedButton(
                      style : OutlinedButton.styleFrom(
                        backgroundColor : controller.color.value
                      ),
                      child: SizedBox(
                        width: 120,
                        height: 180,
                        child: Icon(
                          controller.icon.value,
                          color : darkColor.contains(controller.color.value) ? Colors.white : Colors.grey,
                          size : 64
                        )
                      ),
                      onPressed: ()  {
                        Get.dialog(
                          barrierColor : Colors.white.withOpacity(0.0),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 240.0),
                            child: Dialog(
                              child : Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment : MainAxisAlignment.spaceAround,
                                      children: [
                                        iconSelectButton(iconSet[0]),
                                        iconSelectButton(iconSet[1]),
                                        iconSelectButton(iconSet[2]),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment : MainAxisAlignment.spaceAround,
                                      children: [
                                        iconSelectButton(iconSet[3]),
                                        iconSelectButton(iconSet[4]),
                                        iconSelectButton(iconSet[5]),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ),
                          )
                        );
                      },
                  );
                }
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetX<WorkbookController>(
                  builder: (controller) {
                    return ColorSelector(
                      height: 40,
                      selectedColor: controller.color.value,
                      numColor: 9,
                      pallete: pallete,
                      onPressed: (color){
                         controller.setColor(color);
                      }
                    );
                  }
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<WorkbookController>(
                  builder: (controller) {
                    return TextField(
                      decoration: InputDecoration(
                      hintText: defaultName,
                      ),
                      textAlign : TextAlign.center,
                      controller: _textController,
                      onChanged: (String value) {
                        controller.setName(value);
                        if(value.isEmpty){
                          controller.setName(defaultName);
                        }
                      }
                    );
                  }
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<WorkbookController>(
                  builder: (controller) {
                    return PrimaryButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Get.offNamed('/new/simple');
                      },
                      text: '????????? ?????????'
                    );
                  }
                ),
              ),
              GetBuilder<WorkbookController>(
                builder: (controller) {
                  return SecondaryButton(
                    onPressed: (){
                      FocusScope.of(context).unfocus();
                      Get.offNamed('/new/exel');
                    },
                    text: '????????? ?????????'
                  );
                }
              ),
            ],
          )
        ),
    );
  }
}