import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/Cartdata.dart';
import '../Models/product_model.dart';
import '../Screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //card is for elevation
    //listener for listening to changes of current passed elements
    final product = Provider.of<Product>(context);
    final cartItem = Provider.of<Cart>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 6,
      //clipRRect for shaping borders

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        //GridTile for creating griditems

        child: GridTile(
          //GestureDetector Widget allows you to wrap any widget and if someone taps on the widget you can register a gesture.
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProductDetails(productId: product.id),
              ),
            ),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,

            //This consumer widget is an alternative for provider.of , it is also a listener difference in use case is that when we use provider.of we can only use it in a build() method and when a rebuild occurs every widget in that build() rebuild even though the changed data doesnt affect every widget , But while using consumer when we enclose the widgets we need to rebuild into the its builder method so that when rebuilds occurs only that widget is rebuilt. This is good for optimization and speed.
            leading: Consumer<Product>(
              builder: (ctx, product, _ /*child*/) => IconButton(
                constraints: BoxConstraints(maxWidth: 27),
                iconSize: 20,
                icon: Icon(
                  product.isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  product.toggleFavourites();
                },
              ),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            trailing: IconButton(
              iconSize: 20,
              constraints: BoxConstraints(maxWidth: 27),
              icon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                cartItem.addCartItem(
                  product.id,
                  product.title,
                  product.price,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
