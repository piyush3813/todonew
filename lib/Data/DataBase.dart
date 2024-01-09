import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList = [];

  //REFERENCE OUR BOX
  final _myBox = Hive.box('myBox');

  void createinitialData() {
    todoList = [
      ["Task 1", false],
      ["Task 2", false]
    ];
  }

  //load data from database

void loadData(){
    todoList = _myBox.get("TODOLIST");

}

void updateDatabase(){
    _myBox.put("TODOLIST", todoList); 
}




}
