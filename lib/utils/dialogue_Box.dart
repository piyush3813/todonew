import 'package:flutter/material.dart';
import 'package:to_do_list/utils/My_Button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  //SAVE
  VoidCallback onSave;
  //CANCEL
  VoidCallback onCancel;

  DialogueBox(
      {super.key,
      this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //save button

                  Mybutton(text: "Save", onPressed: onSave),

                  const SizedBox(
                    width: 10,
                  ),
                  //cancel button
                  Mybutton(text: "Cancel", onPressed: onCancel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
