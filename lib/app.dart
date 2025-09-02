import 'package:flutter/material.dart';
import 'package:flutter_practice_project/Module_8/Module8_class1.dart';
import 'package:flutter_practice_project/class3.dart';
import 'Assignment/assignment1.dart';
import 'CRUD App Function/CRUD_home_screen.dart';
import 'Figma_practice/cover_page.dart';
import 'Live Test/recipeListScreen.dart';
import 'Module 9/Module9_Class3.dart';
import 'Figma_practice/product_page.dart';
import 'Module 9/city_card.dart';
import 'Module 9/class_1.dart';
import 'Module_11/counterApp.dart';
import 'Module_11/sumApp.dart';
import 'Module_11/water_tracker_app.dart';
import 'Module_12/Todo_app/todo_main_screen.dart';
import 'Module_12/money_management_app.dart';
import 'Module_8/Module8_Stack.dart';
import 'Module_8/Module8_class2.dart';
import 'listView.dart';
import 'Module_8/module8_class3.dart';
import 'own_practice_project/expence_tracker_app.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          color: Colors.teal
        ),
      ),
      title: 'This is my first project',
      home: RecipeListScreen(),
      // initialRoute: '/MoneyManagementApp',
      // routes: {
      //   '/' : (context) => assignment1(),
      //   '/Figma' : (context) => cove_page(),
      //   '/Class1' : (context) => alert(),
      //   '/Module9_Class3' : (context) => Moddue9Class3(),
      //   '/Material_App' : (context) => CounterApp(),
      //   '/calculator' : (context) => Calculator(),
      //   '/WaterTrackerApp' : (context) => WaterTrackerApp(),
      //   '/MoneyManagementApp' : (context) => MoneyManagementApp()
      // },
    );
  }
}
