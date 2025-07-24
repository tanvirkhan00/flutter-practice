import 'package:flutter/material.dart';

class module8_class3 extends StatelessWidget {
  const module8_class3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Grid View'),
        ),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 20,
      //   mainAxisSpacing: 20,
      //   children: List.generate(10, (index) {
      //       return Card(
      //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      //         color: Colors.red,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Icon(Icons.phone_android, color: Colors.white, size: 50,),
      //             Text('Cash Out', style: TextStyle(fontSize: 25, color: Colors.white),),
      //           ],
      //         ),
      //       );
      //     })
      // ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android, color: Colors.white, size: 40,),
                  Text(index.toString(), style: TextStyle(fontSize: 20, color: Colors.white),),
                ],
              ),
            );
          }),
    );
    
  }
}
