import 'dart:math';

import 'package:belajar_flutter/models/product.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Faker faker = Faker();
  @override
  Widget build(BuildContext context) {
    List<Product> product = List.generate(100, (index) {
      return Product(
          "https://picsum.photos/id/$index/200",
          faker.food.restaurant(),
          10000 + Random().nextInt(100000),
          faker.lorem.sentence());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Market Place"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(product[index].ImageUrl),
            footer: Container(
              color: Colors.green,
              child: Column(children: [
                Text(
                  product[index].judul,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                Text("Rp. ${product[index].harga.toString()}"),
              ]),
            ),
          );
        },
      ),
    );
  }
}
