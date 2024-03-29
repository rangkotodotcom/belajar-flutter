// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product2.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: (productData.isFavorite)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              color: Colors.amber,
              onPressed: () {
                productData.statusFav();
              },
            ),
          ),
          title: Text(
            productData.title.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Berhasil ditambahkan"),
                  duration: Duration(
                    microseconds: 500,
                  ),
                ),
              );
              cart.addCart(
                productData.id.toString(),
                productData.title.toString(),
                productData.price!.toDouble(),
              );
            },
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}
