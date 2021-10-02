import 'package:flutter/foundation.dart';

//nested inside of PRODUCTS provider
class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;

  bool isFav;

  Product({
    @required this.id,
    @required this.description,
    @required this.imageUrl,
    @required this.title,
    @required this.price,
    this.isFav = false,
  });

  void toggleFavourites() {
    isFav = !isFav;
    print(isFav);
    notifyListeners();
  }
}
