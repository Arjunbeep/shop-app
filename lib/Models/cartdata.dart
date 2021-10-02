import 'package:flutter/foundation.dart';

//This is a provider
//Model for a cartItem (its properties and methods)
class CartItem {
  String id;
  String title;
  double price;
  double quantity;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};
  //a map containing string keys and values of dataModel CartItem class
  double totalItems = 0;
  var netTotal = 0;

  String get cartQuantity {
    if (_cartItems == null) {
      return '0';
      //if getter cartQuantity is called if there aint any products added to cart return 0
    } else {
      return netTotal.toString();
    }
  }

  Map<String, CartItem> get cartItems {
    return {
      ..._cartItems,
    };
  }

  void addCartItem(String productId, String prodTitle, double prodPrice) {
    print('add');
    //Checks if a cartItem exists which contains the productId as key
    if (_cartItems.containsKey(productId)) {
      print('Product already added to cart added one more time');
      _cartItems.update(
        productId,

        //If an existing item is to be added to cart then a new item is created having quantity increased by 1.

        (value) => CartItem(
          id: value.id,
          title: value.title,
          price: value.price,
          quantity: value.quantity +
              1, //indicates number of a particular product added to the cart
        ),
      );
      netTotal = netTotal + 1;
      //if no item exists with a key of the current productId then a new item is created.
    } else {
      print('Product added to cart for the first time');
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: prodTitle,
          price: prodPrice,
          quantity: 1,
        ),
      );
      netTotal = netTotal + 1; //total number of products in cart
    }
    notifyListeners();
  }
}
