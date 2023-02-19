import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        // visualDensity: VisualDensity.comfortable,
        // visualDensity: VisualDensity.compact,
        // visualDensity: VisualDensity(horizontal: 0, vertical: 0),
        // primarySwatch: Colors.blueGrey,
        // primarySwatch: MaterialColor(
        //   0xFFF5E0C3,
        //   <int, Color>{
        //     50: Color(0x1a5D4524),
        //   },
        // ),
        // primaryColor: Colors.green,
        // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.amberAccent,
            fontFamily: 'Source Sans Pro',
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.green,
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This is a text",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "This is a text",
              style: TextStyle(
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Button",
                  style: TextStyle(
                      fontSize: 35, color: Theme.of(context).highlightColor),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.mediation,
        ),
      ),
    );
  }
}
