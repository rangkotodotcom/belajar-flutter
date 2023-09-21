import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/checkbox_colors.dart';
import './pages/checkbox_home_page.dart';
import './pages/checkbox_add_color_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MultiColor(),
      builder: (context, child) => MaterialApp(
        home: const HomePage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          AddColorPage.routeName: (ctx) => AddColorPage(),
        },
      ),
    );
  }
}
