import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ! Widget Image
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        body: Center(
          child: Container(
            width: 350,
            height: 500,
            color: Colors.amber,
            child: Image.asset("images/logo.png"),
            // child: Image(
            //   fit: BoxFit.fill,
            //   // image: AssetImage("images/logo.png"),
            //   image: NetworkImage("https://rangkoto.com/logo.png"),
            // ),
          ),
        ),
      ),
    );
  }
}
