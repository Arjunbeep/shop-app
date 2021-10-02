import 'package:flutter/material.dart';

// Horizontal slider with dot indicators
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_app/Models/Cartdata.dart';
// import 'package:shop_app/Models/product_model.dart';
import 'package:shop_app/Widgets/carouselData.dart';

final Map<String, List<String>> imgList = imageData;

class CarouselWithIndicator extends StatefulWidget {
  final prodId;
  // final cartItem;
  // final product;

  CarouselWithIndicator(
    this.prodId,
    // this.cartItem,
    // this.product,
  );

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    // print(widget.cartItem);
    //listener for listening to changes of current passed elements
    // final cartItem1 = Provider.of<Cart>(context);
    // final product1 = Provider.of<Product>(context);

    final List<String> imagelist = imgList[widget.prodId];
    print(widget.prodId);
    final List<Widget> imageSliders = imagelist
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(70, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();
    return Container(
      child: Column(
        children: [
          SizedBox(
            child: CarouselSlider(
              items: imageSliders,
              carouselController: _controller,
              options: CarouselOptions(
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  height: 200,
                  viewportFraction: 0.5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagelist.map((entry) {
              print(entry);
              final index = imagelist.indexWhere((element) => element == entry);
              print(index);
              return GestureDetector(
                onTap: () => _controller.animateToPage(index),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        // ignore: unrelated_type_equality_checks
                        .withOpacity(_current == index ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
          //CART and Favourites Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.all(10),
                    iconSize: 20,
                    constraints: BoxConstraints(maxWidth: 27),
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      //   print('object');
                      //   widget.cartItem.addCartItem(
                      //     widget.product.id,
                      //     widget.product.title,
                      //     widget.product.price,
                      //   );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(10),
                      iconSize: 20,
                      constraints: BoxConstraints(maxWidth: 27),
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        // cartItem.addCartItem(
                        //   product.id,
                        //   product.title,
                        //   product.price,
                        // );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      //
    );
  }
}
