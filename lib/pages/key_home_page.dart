import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/key_products.dart';
import '../pages/key_add_product_page.dart';
import '../widgets/key_product_item.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context);
    var allProducts = products.allProducts;
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Products"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.pushNamed(context, AddProductPage.routeName),
          ),
        ],
      ),
      body: (allProducts.isEmpty)
          ? const Center(
              child: Text(
                "No Data",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          : ListView.builder(
              itemCount: allProducts.length,
              itemBuilder: (context, i) {
                return ProductItem(
                  allProducts[i].id,
                  allProducts[i].title,
                  allProducts[i].date,
                );
              },
            ),
    );
  }
}
