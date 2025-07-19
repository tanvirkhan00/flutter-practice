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
          Image.network('https://w7.pngwing.com/pngs/128/77/png-transparent-logo-facebook-website-graphics-font-facebook-blue-text-logo.png')
        ],
      ),
    );
  }
}
