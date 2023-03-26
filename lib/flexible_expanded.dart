import "package:flutter/material.dart";

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible adn Expanded"),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: 100,
              color: Colors.red,
              // child: Text("Text 1 - Perpanjang"),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              height: 100,
              color: Colors.green,
              // child: Text("Text 2 - sedikit"),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              color: Colors.amber,
              // child: Text("Text 3S"),
            ),
          ),
        ],
      ),
    );
  }
}
