import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ! Widget Layout ada Column, Row dan Stack
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Column"),
        ),
        body: Stack(
          // mainAxisAlignment: MainAxisAlignment.center, // for column and row
          // crossAxisAlignment: CrossAxisAlignment.stretch, // for column and row
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.green,
            ),
            Container(
              height: 300,
              width: 300,
              color: Colors.blue,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.amber,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
