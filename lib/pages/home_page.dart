import 'package:belajar_flutter/pages/gallery_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  static const nameRoute = '/homepage';

  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: const Center(
        child: Text(
          "HOME PAGE",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(GalleryPage.nameRoute);
        },
        child: const Icon(Icons.arrow_right_alt),
      ),
    );
  }
}
