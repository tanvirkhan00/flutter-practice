import 'package:flutter/material.dart';

import '../update_product_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(),
          title: Text('Product Name'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Code: 458487"),
              Row(
                spacing: 16,
                children: [Text("Quantity: 5"), Text("Unit Price: 500")],
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
              } else if (SelectedOption == ProductOption.update) {
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
      },
      separatorBuilder: (context, index) {
        return Divider(indent: 70);
      },
    );
  }
}

enum ProductOption { update, delete }