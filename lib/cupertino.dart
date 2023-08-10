import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cupertino"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Platform.isIOS
                      ? CupertinoAlertDialog(
                          title: const Text("Delete Item"),
                          content: const Text("Are You Sure?"),
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Yes"),
                            ),
                          ],
                        )
                      : AlertDialog(
                          title: const Text("Delete Item"),
                          content: const Text("Are You Sure?"),
                          actions: [
                            TextButton(
                              onPressed: () {},
                              child: const Text("No"),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                });
          },
          child: const Text("Alert Dialog"),
        ),
      ),
    );
  }
}
