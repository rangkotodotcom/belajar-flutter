import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth_products.dart';
import './providers/auth.dart';

import './pages/auth_page.dart';
import './pages/auth_home_page.dart';
import './pages/auth_add_product_page.dart';
import './pages/auth_edit_product_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthB(),
        ),
        ChangeNotifierProxyProvider<AuthB, Products>(
          create: (context) => Products(),
          update: (context, value, previous) =>
              previous!..updateData(value.token, value.userId),
        )
      ],
      builder: (context, child) => Consumer<AuthB>(
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: value.isAuth ? const HomePage() : const LoginPage(),
          routes: {
            AddProductPage.route: (ctx) => AddProductPage(),
            EditProductPage.route: (ctx) => const EditProductPage(),
          },
        ),
      ),
    );
  }
}
