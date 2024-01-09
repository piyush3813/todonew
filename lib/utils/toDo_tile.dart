import 'dart:ffi';

import'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {
  final String tskName;
  final bool tskCompleted;
  Function (bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

   ToDoTile({super.key,
     required this.tskName,
     required this.tskCompleted,
     required this.onChanged,
   required this.deleteFunction});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,top: 25,right: 25),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: deleteFunction,
               icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
                borderRadius: BorderRadius.circular(12),
              )

            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color:Colors.grey[800],
            borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Checkbox(value: tskCompleted,activeColor: Colors.yellow,
                    checkColor: Colors.grey[800], onChanged: onChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 2.0, color: Colors.white),
                  ),),
                 Text(tskName,
                  style: TextStyle(
                    decoration: tskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,  // Set the text color to white
                ),
                        ),
              ],
            ),
          ),
        ),
    ) ;
  }
}
