import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/utils/dialogue_Box.dart';
import 'package:to_do_list/utils/toDo_tile.dart';

import 'Data/DataBase.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//REFERENCE HIVE BOX
final _myBox = Hive.box('myBox');

ToDoDatabase db = ToDoDatabase();

@override
void initState() {
    // TODO: implement initState

    if (_myBox.get("TODOLIST") == null){
      db.createinitialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }

  //CONTROLLER
  final _controller = TextEditingController();

//CHECKBOX WASS TAPPED
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  //SAVE FUNCTION

  void saveNewtask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
      Navigator.of(context).pop();
      db.updateDatabase();

  }

  //CREATE NEW TASK
  void createNewtask() {
    showDialog(context: context, builder: (context) {
      return DialogueBox(controller: _controller,
        onSave: saveNewtask,
      onCancel: () => Navigator.of(context).pop( ),);
    },
    );
  }

  //DELETE TASK
  void deletetask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('To Do',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the text bold
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewtask,
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.grey[800],
      ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(tskName: db.todoList[index][0],
            tskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) =>  deletetask(index) ,
          );
        },

      ),
    );
  }

}