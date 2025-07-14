import 'package:flutter/material.dart';


class Home extends StatelessWidget {
   const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('It is app Bar'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Name is Tanvir' , style: TextStyle(color: Colors.red, fontSize: 30,fontWeight: FontWeight.bold,),),
            Text('My am 25 years old', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold,),),
            Text('I am a junior shopify Developer', style: TextStyle(color: Colors.blue, fontSize: 20,fontWeight: FontWeight.bold,),),

            Row(
              children: [
                Text(style: TextStyle(color: Colors.red, fontSize: 30,fontWeight: FontWeight.bold,) , 'My Name is Tanvir',),
                Text('My am 25 years old', style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold,),),
                Text('I am a junior shopify Developer', style: TextStyle(color: Colors.blue, fontSize: 20,fontWeight: FontWeight.bold,),),
              ],
            )
          ],

        ),


      ),
    );
  }
}
