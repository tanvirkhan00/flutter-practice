import 'package:flutter/material.dart';

class Module8Class2 extends StatelessWidget {
  const Module8Class2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module8 Class2'),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Center(
            child: Image.network('https://cdn.freebiesupply.com/logos/large/2x/facebook-1-logo-png-transparent.png',
            height: 100, width: 200,),
          ),
          Image.asset('asset/yt.png.png',
            height: 100, width: 200,)
        ],
      ),
    );
  }
}
