import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCard extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext?)? delete;
  TodoCard({
    super.key,
    required this.taskName,
    required this.onChanged,
    required this.taskComplete,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delete,
              icon: Icons.fire_extinguisher,
              backgroundColor: Colors.red.shade400,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 167, 167, 167),
                // spreadRadius: 1,
                blurRadius: 10,
                // offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 17,
                    decoration: taskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Checkbox(
                value: taskComplete,
                onChanged: onChanged,
                activeColor: Colors.green,
                shape: const CircleBorder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
