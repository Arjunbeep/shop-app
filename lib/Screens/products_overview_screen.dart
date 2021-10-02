import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/products.dart';
import 'package:shop_app/Widgets/badge.dart';
import 'package:shop_app/Widgets/product_item.dart';

//Stateful widgets are efficient in managing local widget and providers are good for application wide state.
class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool favSelected = false;

  @override
  Widget build(BuildContext context) {
    //GridView.builder is preferred for long lists of grid items as it only renders the products that are in the display and not the entire list so it helps with performance and speeds up the app.

    final productsData = Provider.of<Products>(context); //Listener for provider

    //loadedProducts now contain LIST[Product() elements Product() is also a provider like  Products()]

    final loadedProducts = favSelected
        ? productsData.items.where((item) => item.isFav).toList()
        : productsData.items; //getter function
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          'Shop',
          style: TextStyle(
            fontFamily: 'Lato-Bold',
          ),
        ),
        actions: [
          Badge(),
          //Contains the stack having both the cart button and its quantity indication label.
          PopupMenuButton(
            onSelected: (int selected) {
              if (selected == 0) {
                //This setState only affects local state and wont spread to another widgets .
                setState(
                  () {
                    favSelected = true;
                  },
                );
              } else {
                setState(
                  () {
                    favSelected = false;
                  },
                );
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('Favourites'),
                value: 0,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: 1,
              ),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: loadedProducts.length,
        //ItemBuilder always returns a widget and assigns it as gridItem

        //Here we use value instead of builder/create property because builders are useful when it comes to creating new instances of a class.

        //Previously created data can be provided using value property and it is conveneint.
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: loadedProducts[i],
          //( this is the individual element stored in loadedProduct which uses Product() class/provider inside product_model )

          child: ProductItem(
              //we dont need to pass arguments as we can assess them through provider function.
              ),
        ),

        //gridDelegate : property of gridView.builder which allows you to specify the crossAxisCount - no of grids per row and the childAspectration gridDelegate takes a sliverGridDelegatefixedCrossAxisCount and in that class you can specify these properties.

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
        ),
      ),
    );
  }
}
