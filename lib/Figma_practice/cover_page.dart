import 'package:flutter/material.dart';

class cove_page extends StatelessWidget {
  const cove_page({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            child: Image.network('https://images.unsplash.com/photo-1691775755067-a9807ac8939c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGN1cCUyMG9mJTIwY29mZmVlfGVufDB8fDB8fHww',
            fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Fall in Love with Coffee in Blissful Delight/!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
                ),
                Text("Welcome to our cozy coffee corner, where every cup is a delightful for you",
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w500,
                  fontSize: 20
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      print("Hello Cuty");
                    },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown
                        ),
                        child: Text('Get Started', style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),)))
              ],
            ),
          )
        ],
      )
    );
  }
}
