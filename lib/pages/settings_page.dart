import 'package:belajar_flutter/pages/home_page_satu.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 150,
              color: Colors.green,
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Menu Pilihan",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const MyHomePageSatu();
                    },
                  ),
                );
              },
              leading: const Icon(
                Icons.home,
                size: 35,
              ),
              title: const Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingsPage();
                    },
                  ),
                );
              },
              leading: const Icon(
                Icons.settings,
                size: 35,
              ),
              title: const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Settings",
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
    );
  }
}
