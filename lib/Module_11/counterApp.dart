import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
   CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int number =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500
        ),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(number.toString(),
              style: TextStyle(
              fontSize: 60
            ),),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    number -- ;
                  });
                  print(number);
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow
                    ),
                    child: Text('-', style: TextStyle(
                  fontSize: 30
                ),)),
                ElevatedButton(onPressed: (){
                  setState(() {
                    number ++;
                  });
                  print(number);
                },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow
                    ),
                    child: Text('+', style: TextStyle(
                    fontSize: 30
                ),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
