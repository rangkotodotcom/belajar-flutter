import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ! Widget Listtile
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("List Tile"),
        ),
        body: ListView(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: const Text("Jamilur"),
              subtitle: const Text("online"),
              leading: const CircleAvatar(),
              trailing: const Text("10:00 PM"),
              // tileColor: Colors.amber,
              dense: true,
              onTap: () {
                return;
              },
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
