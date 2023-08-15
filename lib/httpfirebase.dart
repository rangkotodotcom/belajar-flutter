import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/players.dart';
import './pages/detail_player_page.dart';
import './pages/add_player_page.dart';
import './pages/home_player_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Players(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          AddPlayer.routeName: (context) => AddPlayer(),
          DetailPlayer.routeName: (context) => const DetailPlayer(),
        },
      ),
    );
  }
}
