import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("MY APPBAR"),
          centerTitle: true,
          leading: const CircleAvatar(
            backgroundImage: AssetImage("images/logo.png"),
          ),
          actions: [
            Container(
              width: 35,
              color: Colors.purple,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(200),
            child: Container(
              width: 35,
              height: 200,
              color: Colors.black,
            ),
          ),
          flexibleSpace: Container(
            width: 35,
            height: 200,
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
