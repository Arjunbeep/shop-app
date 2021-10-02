import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Models/Cartdata.dart';
import './Screens/cartScreen.dart';
import 'package:shop_app/Screens/product_details_screen.dart';

import 'Models/products.dart';
import './Screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //For using multiple providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Shop',
        theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.blue,
          accentColor: Colors.yellow,
          fontFamily: 'Lato',
        ),
        home: MyHomePage(),
        routes: {
          ProductDetails.routeName: (ctx) => ProductDetails(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return ProductsOverviewScreen();
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
