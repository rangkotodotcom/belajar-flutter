import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ! Widget Listtile
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List Tile"),
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10),
              title: Text("Jamilur"),
              subtitle: Text("online"),
              leading: CircleAvatar(),
              trailing: Text("10:00 PM"),
              // tileColor: Colors.amber,
              dense: true,
              onTap: () {
                return;
              },
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
