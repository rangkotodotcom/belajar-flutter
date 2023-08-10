import 'package:belajar_flutter/pages/photo_page.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  static const nameRoute = '/gallerypage';

  const GalleryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery Page"),
        // leading: Container(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "GALLERY PAGE",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(PhotoPage.nameRoute);
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
