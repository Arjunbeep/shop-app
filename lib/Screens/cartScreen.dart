import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/product_model.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartScreen';

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    print(product.id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Text(product.id),
        ],
      ),
    );
  }
}
