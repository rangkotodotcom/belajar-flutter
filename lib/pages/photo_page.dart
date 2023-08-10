import 'package:flutter/material.dart';

class PhotoPage extends StatelessWidget {
  static const nameRoute = '/photopage';

  const PhotoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Page"),
        // leading: Container(),
      ),
      body: const Center(
        child: Text(
          "PHOTO PAGE",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
