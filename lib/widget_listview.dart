import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ! Widget Listview
class MyApp extends StatelessWidget {
  final List<Color> myColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
    Colors.cyan
  ];
  final List<Widget> myList = [
    Container(
      height: 300,
      width: 300,
      color: Colors.red,
    ),
    Container(
      height: 300,
      width: 300,
      color: Colors.green,
    ),
    Container(
      height: 300,
      width: 300,
      color: Colors.blue,
    ),
    Container(
      height: 300,
      width: 300,
      color: Colors.amber,
    ),
  ];
  final List<Widget> myList2 = List.generate(
    100,
    (index) => Text(
      "${index + 1}",
      style: TextStyle(
        fontSize: 20 + double.parse(index.toString()),
      ),
    ),
  );

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List View"),
        ),
        body: ListView(
          children: myList2,
        ),
      ),
    );
  }
}
