import 'package:flutter/material.dart';

import 'package:todo_app/components/buttons.dart';

class DialogBox extends StatelessWidget {
  final controll;
  final onSave;
  final onCancel;
  DialogBox(
      {super.key,
      required this.controll,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue.shade100,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controll,
              decoration: InputDecoration(
                  hintText: "Create a new Task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(name: "Save", onPressed: onSave),
                const SizedBox(
                  width: 10,
                ),
                MyButton(name: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
