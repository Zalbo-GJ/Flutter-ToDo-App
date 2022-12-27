import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/db.dart';

import '../components/card.dart';
import '../components/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the box
  final my_box = Hive.box('mybox');
  final txtControl = TextEditingController();

  TodoDB db = TodoDB();

  @override
  void initState() {
    // TODO: implement initState
    if (my_box.get("TODO") == null) {
      db.createInit();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void checking(bool? taskComplete, int index) {
    setState(() {
      db.todo[index][1] = !db.todo[index][1];
    });
  }

  // create new task
  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controll: txtControl,
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSave: () {
              setState(() {
                db.todo.add([txtControl.text, false]);
                txtControl.clear();
              });
              db.updateData();
              Navigator.of(context).pop();
            },
          );
        });
  }

  // Delete a Task
  void deleteTask(int index) {
    setState(() {
      db.todo.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('To Do')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
          itemCount: db.todo.length,
          itemBuilder: (context, index) {
            return TodoCard(
              taskName: db.todo[index][0],
              onChanged: (val) => checking(val, index),
              taskComplete: db.todo[index][1],
              delete: ((context) => deleteTask(index)),
            );
          },
        ),
      );
}
