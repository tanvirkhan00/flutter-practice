import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/Models/product.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/utils/urls.dart';
import 'package:http/http.dart';
import '../update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(product.image,
          errorBuilder: (_, __, ___){
          return Icon(Icons.error);
          },),
      ),
      title: Text( product.name ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Code: ${product.code}"),
          Row(
            spacing: 16,
            children: [Text("Quantity: ${product.quantity}"),
              Text("Unit Price: ${product.unitPrice}")],
          ),
        ],
      ),
      trailing: PopupMenuButton<ProductOption>(
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: ProductOption.update,
              child: Text('Update'),
            ),
            PopupMenuItem(
              value: ProductOption.delete,
              child: Text('Delete'),
            ),
          ];
        },
        onSelected: (ProductOption SelectedOption) {
          if (SelectedOption == ProductOption.delete) {
            print("Delete");
          } else if
          (SelectedOption == ProductOption.update) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UpdateProductScreen(),
              ),
            );
          }
          ;
        },
      ),
    );
  }
}

enum ProductOption { update, delete }