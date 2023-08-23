// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/player.dart';

class Players with ChangeNotifier {
  final List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  addPlayer(String name, String position, String image) async {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://belajar-flutter-a2003-default-rtdb.asia-southeast1.firebasedatabase.app/players.json");

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
            "createdAt": datetimeNow.toString(),
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        _allPlayer.add(
          Player(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            position: position,
            imageUrl: image,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  editPlayer(String id, String name, String position, String image) async {
    Uri url = Uri.parse(
        "https://belajar-flutter-a2003-default-rtdb.asia-southeast1.firebasedatabase.app/players/$id.json");
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "name": name,
            "position": position,
            "imageUrl": image,
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Player selectPlayer =
            _allPlayer.firstWhere((element) => element.id == id);
        selectPlayer.name = name;
        selectPlayer.position = position;
        selectPlayer.imageUrl = image;
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  deletePlayer(String id) async {
    Uri url = Uri.parse(
        "https://belajar-flutter-a2003-default-rtdb.asia-southeast1.firebasedatabase.app/players/$id.json");

    try {
      final response = await http.delete(url);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        _allPlayer.removeWhere((element) => element.id == id);
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> initialData() async {
    Uri url = Uri.parse(
        "https://belajar-flutter-a2003-default-rtdb.asia-southeast1.firebasedatabase.app/players.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body);

    if (dataResponse != null) {
      dataResponse as Map<String, dynamic>;
      dataResponse.forEach((key, value) {
        DateTime dateTimeParse =
            DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
        _allPlayer.add(
          Player(
            id: key,
            name: value["name"],
            position: value["position"],
            imageUrl: value["imageUrl"],
            createdAt: dateTimeParse,
          ),
        );
      });
      notifyListeners();
    }
  }
}
