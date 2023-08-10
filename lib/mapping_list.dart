import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> myList = [
    {
      "name": "Jamilur",
      "age": 24,
      "favColor": [
        "Black",
        "Green",
        "Amber",
        "Black",
        "Green",
        "Amber",
        "Black",
        "Green",
        "Amber",
        "Black",
        "Green",
        "Amber"
      ],
    },
    {
      "name": "Fany",
      "age": 23,
      "favColor": ["Blue", "Pink", "Gray"],
    }
  ];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ID Apps"),
        ),
        body: ListView(
          children: myList.map((data) {
            List favColor = data['favColor'];
            return Card(
              margin: const EdgeInsets.all(10),
              color: Colors.black12,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name : ${data['name']}"),
                            Text("Age : ${data['age']}"),
                          ],
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: favColor.map((color) {
                          return Container(
                            color: Colors.amber,
                            margin: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 8,
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(color),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
