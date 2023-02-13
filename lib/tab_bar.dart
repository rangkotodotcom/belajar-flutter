import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Tab> myTab = [
    Tab(
      // text: "Tab 1",
      icon: Icon(Icons.home),
    ),
    Tab(
      // text: "Tab 2",
      icon: Icon(Icons.qr_code_2_rounded),
    ),
    Tab(
      // text: "Tab 3",
      icon: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('TAB BAR'),
            bottom: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              // indicatorColor: Colors.purple,
              // indicatorWeight: 5,
              indicator: BoxDecoration(
                color: Colors.green,
                // borderRadius: BorderRadius.circular(100),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                ),
              ),
              tabs: myTab,
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("tab 1"),
              ),
              Center(
                child: Text("tab 2"),
              ),
              Center(
                child: Text("tab 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
