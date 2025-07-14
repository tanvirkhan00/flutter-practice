import 'package:flutter/material.dart';

class Class3  extends StatelessWidget {
  const Class3 ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade500,
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
            }, child: Text('Submit')),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              // width: 300,
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                  textStyle: TextStyle(fontSize: 25,)
                ),
                  onPressed:(){
                print('Clicked');
              }, child: Text('Submit')),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(onPressed: (){}, child: Text('Outline Button')),
            SizedBox(
              height: 20,
            ),
            TextButton(onPressed: (){}, child: Text('Text Button', style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.w700),)),
            Icon(Icons.phone_bluetooth_speaker,
              size: 50,
            ),
            IconButton(onPressed: (){
              print("Object Deleted");
            }, icon: Icon(Icons.delete, size: 50,color: Colors.red,)),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                print("Test Press");
              },
                child: Text("Read More", style: TextStyle(fontSize: 30),)),
            InkWell(
              onLongPress: (){
                print("Load Content.............");
              } ,
                child: Text("More Content", style: TextStyle(fontSize: 30, color: Colors.red),)),
            Padding(
                 // padding: EdgeInsets.only(top: 40, right: 50),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Text("This is padding", style: TextStyle(fontSize: 30, color: Colors.red),))
          ],
        ),
      ),
    );
  }
}
