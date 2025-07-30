import 'package:flutter/material.dart';

class own_widget extends StatelessWidget {
  final String img, title, rating;
  const own_widget({
    super.key, required this.img, required this.title, required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius:BorderRadius.circular(10),
          child: Image.network(img,
            width: 400,
            height: 200,
            fit: BoxFit.cover,

          ),
        ),
        Positioned.fill(
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),),
                Text('⭐ 4.5', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.orange),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
