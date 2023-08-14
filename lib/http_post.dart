import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './models/http_provider.dart';

// import './pages/home_stateful.dart';
import './pages/home_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeStateful(),
      home: ChangeNotifierProvider(
        create: (context) => HttpProvider(),
        child: const HomeProvider(),
      ),
    );
  }
}
