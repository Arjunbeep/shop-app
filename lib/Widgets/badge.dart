import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Screens/cartScreen.dart';

import '../Models/Cartdata.dart'; //for importing cartItem quantity

class Badge extends StatelessWidget {
  // final itemQuantity;

  // Badge(
  //   this.itemQuantity,
  // );
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          }, //on pressing cart item
          icon: Icon(Icons.shopping_cart),
        ),
        SizedBox(
          //for badge and number inside
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.red,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 2.5,
                horizontal: 5.5,
              ),
              child: Consumer<Cart>(
                builder: (ctx, cartItem, _) => Text(
                  cartItem.cartQuantity,
                  style: TextStyle(fontSize: 10),
                ),
              )),
        ),
      ],
    );
  }
}
