import 'package:flutter/material.dart';

import '../listView.dart';

class Module8Class2 extends StatelessWidget {
   Module8Class2({super.key});

   final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module8 Class2'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.network('https://cdn.freebiesupply.com/logos/large/2x/facebook-1-logo-png-transparent.png',
              height: 100, width: 200,),
            ),
            Image.asset('asset/yt.png.png',
              height: 100, width: 200,),
            Text('Login with phone Number and Password', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty ) {
                        return "Please enter your phone number";
                      } else if (value.length != 11) {
                        return "Please enter correct number" ;
                      } else {
                        return null ;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      hintText: 'Your Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                    validator: (value) {
                      if(value == null || value.isEmpty ) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be 6 character";
                      } else {
                        return null ;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(onPressed: (){
                      if(_formKey.currentState!.validate()){
                        // // ScaffoldMessenger.of(context).showSnackBar(
                        // //   SnackBar(content: Text('Login Successful'))
                        // );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => listV(name:phoneController.text,)));
                      }
                    }, child: Text("Login", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),)),
                  ),
                ],
              ),
            ))


          ],
        ),
      ),
    );
  }
}
