import 'package:flutter/material.dart';

import '../Assignment/assignment1.dart';
import '../Module_8/module8_class3.dart';
import '../Figma_practice/cover_page.dart';

class Module9_class2 extends StatelessWidget {
  const Module9_class2 ({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Module 9 Class 2'),
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourite',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Setting',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Container(
            //   height: 200,
            //   color: Colors.red,
            //   child: Center(
            //       child: Text('Home', style: TextStyle(
            //         fontSize: 30
            //       ),)),
            // ),
            // Container(
            //   height: 200,
            //   color: Colors.pink,
            //   child: Center(
            //       child: Text('Favourite', style: TextStyle(
            //         fontSize: 30
            //       ),)),
            // ),
            // Container(
            //   height: 200,
            //   color: Colors.yellow,
            //   child: Center(
            //       child: Text('Setting', style: TextStyle(
            //         fontSize: 30
            //       ),)),
            // ),
            assignment1(),
            module8_class3(),
            cove_page()
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  child:Column(
                    children: [
                      CircleAvatar(
                        radius:35,
                        backgroundImage: AssetImage('asset/profileImage.jpg'),
                      ),
                      Text('Tanvir khan', style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),),
                      Text('kmtanvir1111@gmail.com', style: TextStyle(
                        fontWeight: FontWeight.w600
                      ),)
                    ],
                  )
              ),
              ListTile(
                title: Text('Home', style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                ),),
                onTap: (){},
              ),
              Divider(),
              ListTile(
                title: Text('Shop', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),),
                onTap: (){},
              ),
              Divider(),
              ListTile(
                title: Text('About', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),),
                onTap: (){},
              ),
              Divider(),
              ListTile(
                title: Text('Contact', style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),),
                onTap: (){},
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
