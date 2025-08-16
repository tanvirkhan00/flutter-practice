import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_practice_project/Module_11/widget/water_button.dart';

class WaterTrackerApp extends StatefulWidget {
  const WaterTrackerApp({super.key});

  @override
  State<WaterTrackerApp> createState() => _WaterTrackerAppState();
}

class _WaterTrackerAppState extends State<WaterTrackerApp> {
  int currentIntake = 0;
  final goal = 10000;
  Timer? _time ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _time= Timer.periodic(Duration(seconds: 1), (timer) {
      if (currentIntake >0) {
        setState(() {
          currentIntake = (currentIntake-1).clamp(0, goal);
        });
      }
    });
  }

  void waterAdd(int amount) {
    setState(() {
      currentIntake = (currentIntake + amount).clamp(0, 10000);
    });
  }

  void reset(){
    setState(() {
      currentIntake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Water Tracker App', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(70),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 10,
                    spreadRadius: 2
                  )
                ]
              ),
              child: Column(
                children: [
                  Text("Today's in tank", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),),
                  Text('$currentIntake', style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.green
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.red,
                    strokeWidth: 10,
                    value: currentIntake/goal,
                  ),
                ),
                Text('${(currentIntake/goal *100).toStringAsFixed(0)}%', style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700
                ),)
              ]
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                water_button(amount: 1000, onClick:()=> waterAdd(1000), icon: Icons.local_drink,),
                water_button(amount: 5000, onClick: ()=> waterAdd(5000),),
                water_button(amount: 10000, onClick: ()=> waterAdd(10000),),
              ],
            ),

            SizedBox(
              child: 
              ElevatedButton(onPressed:()=> reset(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow
                  ),
                  child: Text('Reset Tank', style: TextStyle(
                    color: Colors.black
                  ),)),
            )
          ],
        ),
      ),
    );
  }
}

