import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/key_products.dart';
import './pages/key_home_page.dart';
import './pages/key_add_product_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Products>(
      create: (context) => Products(),
      child: MaterialApp(
        home: const HomePage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          AddProductPage.routeName: (ctx) => const AddProductPage(),
        },
      ),
    );
  }
}
