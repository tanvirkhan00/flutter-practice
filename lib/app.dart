import 'package:flutter/material.dart';
import 'package:flutter_practice_project/Module8_class1.dart';
import 'package:flutter_practice_project/class3.dart';
import 'Module8_class2.dart';

class MyApp  extends StatelessWidget {
  MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is my first project',
      home:Module8Class2()
    );
  }
}
