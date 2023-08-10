import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;

    final myAppBar = AppBar(
      title: const Text("Layout Builder"),
    );

    final heightBody = heightApp - paddingTop - myAppBar.preferredSize.height;

    return Scaffold(
      appBar: myAppBar,
      body: Container(
        width: widthApp,
        height: heightBody * 0.3,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyContainer(widthApp),
            MyContainer(widthApp),
            MyContainer(widthApp),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final double widthApp;

  // ignore: prefer_const_constructors_in_immutables
  MyContainer(this.widthApp, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: widthApp * .25,
          height: constraints.maxHeight * .5,
          color: Colors.amber,
        );
      },
    );
  }
}
