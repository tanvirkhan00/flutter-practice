import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  bool _addProductInProgress = false ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
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
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return("Enter Your Value");
                      } else {
                        return null ;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _codeTEController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Product Code',
                      labelText: 'Product Code'
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return("Enter Your Value");
                      } else {
                        return null ;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _quantityTEController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Quantity',
                      labelText: 'Quantity'
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return("Enter Your Value");
                      } else {
                        return null ;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _priceTEController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Unit Price',
                      labelText: 'Unit Price'
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return("Enter Your Value");
                      } else {
                        return null ;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _imageTEController,
                    decoration: InputDecoration(
                      hintText: 'Image Url',
                      labelText: 'Image Url'
                    ),
                    validator: (String? value){
                      if(value?.trim().isEmpty ?? true){
                        return("Enter Your Value");
                      } else {
                        return null ;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                    visible: _addProductInProgress == false,
                    replacement: Center(
                        child: CircularProgressIndicator()),
                    child: FilledButton(onPressed: _addNewProduct,
                        child: Text("Add Product")),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Future<void> _addNewProduct () async {
    if(!_formKey.currentState!.validate()) {
      return;
    }

    _addProductInProgress = true ;
    setState(() { });
    Uri uri = Uri.parse('http://35.73.30.144:2008/api/v1/CreateProduct');

     int totalPrice = int.parse(_priceTEController.text) * int.parse(_quantityTEController.text);
      Map<String, dynamic> requestedBody ={
        "ProductName": _nameTEController.text,
        "ProductCode": int.parse(_codeTEController.text),
        "Img": _imageTEController.text,
        "Qty": int.parse(_quantityTEController.text),
        "UnitPrice": int.parse(_priceTEController.text),
        "TotalPrice": totalPrice
    };
      //Request data
    Response response = await post(uri ,
        headers: {
         'Content-type': 'application/json'
        },
        body: jsonEncode(requestedBody));
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
       final decodedJson = jsonDecode(response.body);
       if(decodedJson['status'] == 'success') {
         clearTextFeild();
         ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Product Created Successfully')));
    } else {
         String errorMessage = decodedJson['data'];
         ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text(errorMessage)));
       }
    }

    _addProductInProgress = false ;
    setState(() { });
  }



  void clearTextFeild(){
    _nameTEController.clear();
    _codeTEController.clear();
    _quantityTEController.clear();
    _priceTEController.clear();
    _imageTEController.clear();
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
