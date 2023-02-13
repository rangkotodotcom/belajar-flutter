import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController myForm = TextEditingController();

  String Hasil = "Hasil Inputn";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitur TextField"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  cursorColor: Colors.amber,
                  textAlign: TextAlign.start,
                  autocorrect: false,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    prefixIconColor: Colors.amber,
                    hintText: "Please Input Here",
                    hintStyle: TextStyle(
                      color: Colors.amber,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                  controller: myForm,
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      Hasil = value;
                    });
                  },
                  onSubmitted: (value) {
                    print(value);
                    setState(() {
                      Hasil = value;
                    });
                  },
                  onEditingComplete: () {
                    print("EDIT");
                  },
                ),
                TextField(
                  autocorrect: true,
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                  ),
                ),
                Text(Hasil),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
