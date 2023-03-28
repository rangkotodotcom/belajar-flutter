import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Platform.isIOS
                      ? CupertinoAlertDialog(
                          title: Text("Delete Item"),
                          content: Text("Are You Sure?"),
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: Text("No"),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Yes"),
                            ),
                          ],
                        )
                      : AlertDialog(
                          title: Text("Delete Item"),
                          content: Text("Are You Sure?"),
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: Text("No"),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Yes"),
                            ),
                          ],
                        );
                });
          },
          child: Text("Alert Dialog"),
        ),
      ),
    );
  }
}
