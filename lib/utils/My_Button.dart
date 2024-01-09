import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
final String text;
VoidCallback onPressed;
   Mybutton({
     super.key,
   required this.text,
   required this.onPressed,
   });

  @override
  Widget build(BuildContext context) {

    return MaterialButton
      (onPressed: onPressed,
    color: Colors.grey[800],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Set the corner radius here
      ),
    child: Text(text,
      style: TextStyle(color: Colors.white),
    ),


    );

  }
}
