import 'package:flutter/material.dart';


class listV extends StatelessWidget {
  final name ;
  const listV({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('List View', style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600
        ),),
      ),
      body: ListView.builder(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.phone),
                trailing: Icon(Icons.delete, color: Colors.red,),
                title: Text('Tanvir'),
                subtitle: Text(name),
              ),
            );
          }),
    );
  }
}
