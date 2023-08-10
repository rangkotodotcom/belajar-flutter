import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: const Text("Media Query"),
    );

    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: myAppBar,
      body: Center(
        child: (isLandscape)
            ? Column(
                children: [
                  Container(
                    height: bodyHeight * .5,
                    width: mediaQueryWidth,
                    color: Colors.amber,
                  ),
                  Container(
                    height: bodyHeight * .5,
                    color: Colors.red,
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return const ListTile(
                          leading: CircleAvatar(),
                          title: Text("Halo"),
                        );
                      }),
                      itemCount: 20,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    height: bodyHeight * .3,
                    width: mediaQueryWidth,
                    color: Colors.amber,
                  ),
                  Container(
                    height: bodyHeight * .7,
                    color: Colors.red,
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return const ListTile(
                          leading: CircleAvatar(),
                          title: Text("Halo"),
                        );
                      }),
                      itemCount: 20,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
