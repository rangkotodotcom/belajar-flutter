import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/httpdelete_provider.dart';

import './pages/homedelete_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => HttpProvider(),
        child: const HomePage(),
      ),
    );
  }
}
