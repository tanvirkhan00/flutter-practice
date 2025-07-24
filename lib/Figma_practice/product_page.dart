import 'package:flutter/material.dart';

class productPage extends StatelessWidget {
  const productPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Container(
              color: Colors.black,
              child:
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Location', style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white38
                      ),),
                      Row(
                        children: [
                          Text("Bilzen , Tanjungbalai", style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),),
                          Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white,size: 40,)
                        ]
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search Coffee',
                                hintStyle: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 30
                                ),
                                prefixIcon: Icon(Icons.search_rounded, color: Colors.white, size: 40,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide.none
                                ),
                                filled: true,
                                fillColor: Colors.white12
                              ),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(Icons.filter_list_outlined, color: Colors.white,size: 30,),
                            ),
                          )
                        ],
                      )
                    ],
                ),
              )
              ,
            ),
          )
        ],
      ),
    );
  }
}
