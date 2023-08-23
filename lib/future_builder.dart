import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Future<Map<String, dynamic>> ambilData() async {
    try {
      var hasilGet = await http.get(
        Uri.parse('https://reqres.in/api/users/2'),
      );

      if (hasilGet.statusCode >= 200 && hasilGet.statusCode < 300) {
        var data = json.decode(hasilGet.body)['data'] as Map<String, dynamic>;
        return data;
      } else {
        throw (hasilGet.statusCode);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: ambilData(),
        builder: (context, snapshot) {
          if (snapshot.error != null) {
            return const Center(
              child: Icon(Icons.error),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "${snapshot.data?['first_name']} ${snapshot.data?['last_name']}",
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ambilData,
      ),
    );
  }
}
