import 'package:belajar_flutter/pages/gallery_page.dart';
import 'package:belajar_flutter/pages/photo_page.dart';
import 'package:flutter/material.dart';
import 'package:belajar_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      initialRoute: MyHomePage.nameRoute,
      routes: {
        MyHomePage.nameRoute: (context) => const MyHomePage(),
        GalleryPage.nameRoute: (context) => const GalleryPage(),
        PhotoPage.nameRoute: (context) => const PhotoPage(),
      },
    );
  }
}
