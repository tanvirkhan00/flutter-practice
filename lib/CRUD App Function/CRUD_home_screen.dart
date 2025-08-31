import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/update_product_screen.dart';
import 'package:flutter_practice_project/CRUD%20App%20Function/utils/urls.dart';
import 'package:http/http.dart';
import 'Models/product.dart';
import 'Widgets/product_items.dart';
import 'add_new_product_screen.dart';

class CrudHomeScreen extends StatefulWidget {
  const CrudHomeScreen({super.key});

  @override
  State<CrudHomeScreen> createState() => _CrudHomeScreenState();
}

class _CrudHomeScreenState extends State<CrudHomeScreen> {

  List<Product> _productList =[] ;
  bool _getProductInprogress = false ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    _productList.clear();
    _getProductInprogress =true ;
    setState(() { });
    Uri uri = Uri.parse(Urls.getProduct);
    Response response = await get(uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if(response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      for (Map<String, dynamic> productJson in decodedJson['data']){
        Product product = Product();
        product.id = productJson['_id'];
        product.name = productJson['ProductName'];
        product.code = productJson['ProductCode'];
        product.image = productJson['Img'];
        product.quantity = productJson['Qty'];
        product.unitPrice = productJson['UnitPrice'];
        product.totalPrice = productJson['TotalPrice'];

        _productList.add(product);
      }
    }

    _getProductInprogress =false ;
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List'),
      actions: [IconButton(onPressed: (){
        getProduct();
    }, icon: Icon(Icons.refresh),)],
      ),
      body: Visibility(
        visible: _getProductInprogress == false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
          itemCount: _productList.length,
            itemBuilder: (context, index) {
             return ProductItem(product: _productList[index],
               refreshProductList: () {
                 getProduct();
               },);
            },
            separatorBuilder: (context, index) {
            return Divider(
              indent: 70,
            );
            },),
      ),
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


