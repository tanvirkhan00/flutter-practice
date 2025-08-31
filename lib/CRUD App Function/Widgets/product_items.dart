import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/Models/product.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/utils/urls.dart';
import 'package:http/http.dart';
import '../update_product_screen.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({super.key, required this.product, required this.refreshProductList});
  final VoidCallback refreshProductList;

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _deleteinProgress = false ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(widget.product.image,
          errorBuilder: (_, __, ___){
          return Icon(Icons.error);
          },),
      ),
      title: Text( widget.product.name ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Code: ${widget.product.code}"),
          Row(
            spacing: 16,
            children: [Text("Quantity: ${widget.product.quantity}"),
              Text("Unit Price: ${widget.product.unitPrice}")],
          ),
        ],
      ),
      trailing: Visibility(
        visible: _deleteinProgress == false,
        replacement: CircularProgressIndicator(),
        child: PopupMenuButton<ProductOption>(
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
              _deleteProduct();
            } else if
            (SelectedOption == ProductOption.update) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateProductScreen(
                    product: widget.product,
                  ),
                ),
              );
            }
            ;
          },
        ),
      ),
    );
  }

  Future<void> _deleteProduct () async {
    _deleteinProgress = true ;
    setState(() { });

    Uri uri = Uri.parse(Urls.deleteProductUrl(widget.product.id));
    Response response = await get(uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if(response.statusCode == 200){
      widget.refreshProductList();
      }

    _deleteinProgress = false ;
    setState(() {});
  }
}

enum ProductOption { update, delete }