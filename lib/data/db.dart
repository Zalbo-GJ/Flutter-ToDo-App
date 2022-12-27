import 'package:hive_flutter/hive_flutter.dart';

class TodoDB {
  List todo = [];
  // reference our box
  final my_box = Hive.box("myBox");

  void createInit() {
    todo = [
      ["Be a Good person", false],
      ["Face wash", false]
    ];
  }

  // load the data from database
  void loadData() {
    todo = my_box.get("TODO");
  }

  // UPDATE THE DATABASE
  void updateData() {
    my_box.put("TODO", todo);
  }
}
