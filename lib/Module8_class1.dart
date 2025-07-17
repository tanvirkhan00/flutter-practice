import 'package:flutter/material.dart';

class Module8 extends StatelessWidget {
  const Module8({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar', style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Input Your Number',
                labelText: 'Your Number',
                prefixIcon: Icon(Icons.phone),
                suffixIcon: Icon(Icons.check),
                hintStyle: TextStyle(
                    color: Colors.purple,
                    fontSize: 20),
                labelStyle: TextStyle(
                    color: Colors.purple,
                    fontSize: 25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                )
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Input Your Password',
                labelText: 'Your Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25),
                labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 25),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50)
                )
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,

            child: ElevatedButton(onPressed: (){
              if (phoneController.text.isEmpty) {
                print("Please Inter Your Number");
              }
              print(phoneController.text);
              print(passwordController.text);
            }, child: Text('Submit', style: TextStyle(fontSize: 30),)),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,

            child: ElevatedButton(onPressed: (){
              phoneController.clear();
              passwordController.clear();
              print(phoneController.text);
              print(passwordController.text);
            }, child: Text('Delete', style: TextStyle(fontSize: 30),)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            width: 250,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 2,
                color: Colors.black
              )
            ),
            child: Text('My Name is Tanvir Khan'),
          )
        ],
      ),
    );
  }
}
