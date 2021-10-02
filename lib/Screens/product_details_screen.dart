import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/Widgets/slider.dart';

import '../Models/products.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product_details';
  final productId;

  const ProductDetails({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product1 = Provider.of<Products>(context);
    final selectedProd = product1.findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedProd.title),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: CarouselWithIndicator(
          selectedProd.id,
          // cartItem,
          // product,
        ),
      ),
    );
  }
}
