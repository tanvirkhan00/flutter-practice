import 'package:flutter/material.dart';

class module8stack extends StatelessWidget {
  const module8stack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Module 8 Stack'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShIu93nkUhwwHnxeOf5xkXC_F93lItlkVty1LRMY2L35oNACzMPxoBHllmdYUwqznoLsc&usqp=CAU'),
              ),
              Positioned(
                bottom: 25,
                right: 10,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3)
                  ),
                ),
              )
            ],
          ),
          Stack(
            children: [
              Container(
                height: 5,
                width: double.infinity, color: Colors.grey[300],
              )
            ],
          ),
          Stack(
            children: [
              Image.network('https://w0.peakpx.com/wallpaper/164/520/HD-wallpaper-lake-view-bangladesh-bd-lake-mountain-natural-nature.jpg'),
              Positioned(
                bottom: 10,
                  right: 30,
                  child: Text('Nature Of bangladesh', style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.yellow
                  ),))
            ],
          )
        ],
      ),
    );
  }
}
