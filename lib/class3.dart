import 'package:flutter/material.dart';

class Class3  extends StatelessWidget {
  const Class3 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: Text('App Bar', style: TextStyle(color:Colors.white, fontSize: 30,fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontSize: 25,)
              ),
                onPressed:(){
              print('Clicked');
            }, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
