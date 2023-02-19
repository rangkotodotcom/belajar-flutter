import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool statusSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              child: Switch(
                  activeColor: Colors.amber,
                  inactiveThumbColor: Colors.indigo,
                  value: statusSwitch,
                  onChanged: (value) {
                    setState(() {
                      statusSwitch = !statusSwitch;
                    });
                  }),
            ),
            Text(
              (statusSwitch) ? "Switch On" : "Switch Off",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
