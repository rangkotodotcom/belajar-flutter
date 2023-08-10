import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        hintColor: Colors.amber,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
      },
    );
  }
}
