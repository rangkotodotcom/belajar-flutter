import 'package:belajar_flutter/pages/nav_page_dua.dart';
import 'package:flutter/material.dart';

class PageSatu extends StatelessWidget {
  const PageSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Satu"),
      ),
      body: const Center(
        child: Text(
          "Ini Page Satu",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const PageDua();
              },
            ),
          );
        },
        child: const Icon(Icons.keyboard_arrow_right),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
