import 'package:flutter/material.dart';

class Product {
  @required
  String judul;
  @required
  String ImageUrl;
  @required
  int harga;
  @required
  String deskripsi;

  Product(this.ImageUrl, this.judul, this.harga, this.deskripsi);
}
