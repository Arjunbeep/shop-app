//This is a provider to manage state of products displayed in the app

import 'package:flutter/material.dart';

import '../Models/product_model.dart';

//'With' is a mixin like extends but it has a lesser of connection to the child than the extends mixin and also while using extends you can only add one parent class and accept the properties of that class only but while using 'with' you can access nultiple properties of multiple classes.

class Products with ChangeNotifier {
  List<Product> _items = [
    //list with items of Object-type product
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Shoes',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://post.healthline.com/wp-content/uploads/2021/05/1144163-987539-The-Top-7-Altra-Running-Shoes-of-2021-732x549-feature.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items]; //... is the spread operator
  }

  Product findById(String id) {
    final product = _items.firstWhere((element) => element.id == id);
    return product;
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners(); //This literally notifies all listeners about the change made.
  }
}
