import 'package:flutter/material.dart';

class Moddue9Class3 extends StatelessWidget {
  const Moddue9Class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module 9 Class 3'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/');
            }, child: Text('Assignment1,', style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
            ),)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Figma');
            }, child: Text('Figma Practice', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/Class1');
            }, child: Text('City card', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),)),
          ],
        ),
      ),
    );
  }
}
