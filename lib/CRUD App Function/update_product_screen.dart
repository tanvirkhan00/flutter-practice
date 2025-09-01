import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/Models/product.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/utils/urls.dart';
import 'package:http/http.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product, required this.refreshProductList});
  final Product product;
  final VoidCallback refreshProductList;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  bool _updateProductInProgress = false ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();


  @override
  void initState() {
    super.initState();

    _nameTEController.text = widget.product.name;
    _codeTEController.text = widget.product.code.toString();
    _quantityTEController.text = widget.product.quantity.toString();
    _priceTEController.text = widget.product.unitPrice.toString();
    _imageTEController.text = widget.product.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Product"),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 8,
                children: [
                  TextFormField(
                    controller: _nameTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Product Name',
                        labelText: 'Product Name'
                    ),
                  ),
                  TextFormField(
                    controller: _codeTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Product Code',
                        labelText: 'Product Code'
                    ),
                  ),
                  TextFormField(
                    controller: _quantityTEController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Quantity',
                        labelText: 'Quantity'
                    ),
                  ),
                  TextFormField(
                    controller: _priceTEController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Unit Price',
                        labelText: 'Unit Price'
                    ),
                  ),
                  TextFormField(
                    controller: _imageTEController,
                    decoration: InputDecoration(
                        hintText: 'Image Url',
                        labelText: 'Image Url'
                    ),
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                    visible: _updateProductInProgress == false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: FilledButton(onPressed: _updateProduct,
                        child: Text("Update Product")),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Future<void> _updateProduct() async {
    _updateProductInProgress = true ;
    setState(() { });
    Uri uri = Uri.parse(Urls.updateProductUrl(widget.product.id));

    Map<String, dynamic> requestBody ={
      'ProductName' : _nameTEController.text.trim(),
      'ProductCode' : _codeTEController.text.trim(),
      'Qty' : int.tryParse(_quantityTEController.text.trim()) ?? 0,
      'UnitPrice' : int.tryParse(_priceTEController.text.trim()) ?? 0,
      'Img' : _imageTEController.text.trim(),
    };
    Response response = await post(uri,
        headers: {
          'Content-type': 'application/json'
        }, body: jsonEncode(requestBody));

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      widget.refreshProductList();
      if (mounted) {
        Navigator.pop(context);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Update Failed: ${response.statusCode}')),
        );
      }
    }

    _updateProductInProgress = false ;
    setState(() {});
  }


  @override
  void dispose() {
    _nameTEController.dispose();
    _codeTEController.dispose();
    _quantityTEController.dispose();
    _priceTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
