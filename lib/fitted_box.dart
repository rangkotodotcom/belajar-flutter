import "package:flutter/material.dart";

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitted Box"),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          width: 300,
          height: 110,
          child: FittedBox(
            alignment: Alignment.centerRight,
            fit: BoxFit.cover,
            child: Image.network("https://picsum.photos/200/300"),
          ),
        ),
      ),
    );
  }
}
