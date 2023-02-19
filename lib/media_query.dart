import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: Text("Media Query"),
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
                        return ListTile(
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
                        return ListTile(
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
