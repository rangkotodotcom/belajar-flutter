import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          title: const Text("Date Format"),
        ),
        body: Center(
          child: Text(
            DateFormat.yMMMMEEEEd().format(DateTime.now()),
            style: const TextStyle(
              fontSize: 30,
              fontFamily: "Source Sans Pro",
            ),
          ),
        ),
      ),
    );
  }
}
