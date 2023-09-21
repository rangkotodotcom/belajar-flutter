import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/key_products.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(this.prodId, this.title, this.date, {super.key});

  final String prodId, title;

  final DateTime date;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late Color bgColor;
  @override
  void initState() {
    super.initState();
    List<Color> randomColor = [
      Colors.amber,
      Colors.black,
      Colors.red,
      Colors.green,
      Colors.brown,
      Colors.purple,
      Colors.pink,
      Colors.blue,
    ];

    bgColor = randomColor[Random().nextInt(randomColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false);
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(widget.title),
      subtitle: Text(DateFormat.yMMMEd().format(widget.date)),
      trailing: IconButton(
        onPressed: () => products.deleteProduct(widget.prodId),
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
