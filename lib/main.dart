import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'homePage.dart';

void main() async{

  //HIVE

  await Hive.initFlutter();
  //OPEN A BOX

  var box = await Hive.openBox('myBox');

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow,
       ),

    );
  }
}
