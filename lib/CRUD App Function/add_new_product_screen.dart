import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
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
                  FilledButton(onPressed: (){},
                      child: Text("Add Product"))
                ],
              ),
            )),
      ),
    );
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
