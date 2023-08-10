import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
