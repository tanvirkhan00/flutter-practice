import 'package:flutter/material.dart';
import 'package:flutter_practice_project/Module%209/widget/own_widget.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('City Card'),
      ),
      
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            own_widget(img: 'https://e1.pxfuel.com/desktop-wallpaper/585/664/desktop-wallpaper-dhaka-city-dhaka.jpg',title: 'Dhaka City', rating: '⭐ 4.5',),
            SizedBox(
              height: 10,
            ),
            own_widget(img:'https://cdn.wallpapersafari.com/70/83/oEzCpD.png' , title: 'New York', rating: '⭐ 4.8',),
            SizedBox(
              height: 10,
            ),
            own_widget(img: 'https://t3.ftcdn.net/jpg/01/01/14/38/360_F_101143833_nQoJ2pNJYDWzIPLy6r2rUhNeLQQf8bSl.jpg', title: 'Sylet City', rating: '⭐ 5',),
          ],
        ),
      ),
    );
  }
}

