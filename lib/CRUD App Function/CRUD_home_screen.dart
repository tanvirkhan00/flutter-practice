import 'package:flutter/material.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/update_product_screen.dart';

import 'Widgets/product_items.dart';
import 'add_new_product_screen.dart';

class CrudHomeScreen extends StatefulWidget {
  const CrudHomeScreen({super.key});

  @override
  State<CrudHomeScreen> createState() => _CrudHomeScreenState();
}

class _CrudHomeScreenState extends State<CrudHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ProductItem(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewProductScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


