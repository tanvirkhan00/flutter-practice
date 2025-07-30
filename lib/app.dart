import 'package:flutter/material.dart';
import 'package:flutter_practice_project/Module_8/Module8_class1.dart';
import 'package:flutter_practice_project/class3.dart';
import 'Assignment/assignment1.dart';
import 'Figma_practice/cover_page.dart';
import 'Figma_practice/product_page.dart';
import 'Module 9/city_card.dart';
import 'Module_8/Module8_Stack.dart';
import 'Module_8/Module8_class2.dart';
import 'listView.dart';
import 'Module_8/module8_class3.dart';

class MyApp  extends StatelessWidget {
  MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is my first project',
      home:CityCard()
    );
  }
}
