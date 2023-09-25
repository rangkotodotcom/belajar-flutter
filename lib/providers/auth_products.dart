import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/auth_product.dart';

class Products with ChangeNotifier {
  String? token;
  String? userId;

  void updateData(tokenData, userData) {
    token = tokenData;
    userId = userData;
    notifyListeners();
  }

  String baseUrl =
      'https://belajar-flutter-a2003-default-rtdb.asia-southeast1.firebasedatabase.app';
  List<Product> _allProduct = [];

  List<Product> get allProduct => _allProduct;

  Future<void> addProduct(String title, String price) async {
    Uri url = Uri.parse("$baseUrl/products.json?auth=$token");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "userId": userId,
          "createdAt": dateNow.toString(),
          "updatedAt": dateNow.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product data = Product(
          id: json.decode(response.body)["name"].toString(),
          title: title,
          price: price,
          userId: userId.toString(),
          createdAt: dateNow,
          updatedAt: dateNow,
        );

        _allProduct.add(data);
        notifyListeners();
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<void> editProduct(String id, String title, String price) async {
    Uri url = Uri.parse("$baseUrl/products/$id.json?auth=$token");
    DateTime date = DateTime.now();
    try {
      var response = await http.patch(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "updatedAt": date.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product edit = _allProduct.firstWhere((element) => element.id == id);
        edit.title = title;
        edit.price = price;
        edit.updatedAt = date;
        notifyListeners();
      }
    } catch (err) {
      rethrow;
    }
  }

  void deleteProduct(String id) async {
    Uri url = Uri.parse("$baseUrl/products/$id.json?auth=$token");

    try {
      var response = await http.delete(url);

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        _allProduct.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (err) {
      rethrow;
    }
  }

  Product selectById(String id) {
    return _allProduct.firstWhere((element) => element.id == id);
  }

  Future<void> inisialData() async {
    _allProduct = [];
    Uri url = Uri.parse(
        '$baseUrl/products.json?auth=$token&orderBy="userId"&equalTo="$userId"');

    try {
      var response = await http.get(url);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var dataResponse = json.decode(response.body);

        if (dataResponse != null) {
          dataResponse as Map<String, dynamic>;
          dataResponse.forEach((key, value) {
            Product prod = Product(
              id: key,
              title: value["title"],
              price: value["price"],
              userId: value["userId"],
              createdAt:
                  DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]),
              updatedAt:
                  DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["updatedAt"]),
            );
            _allProduct.add(prod);
          });
        }
      }
    } catch (err) {
      rethrow;
    }
  }
}
