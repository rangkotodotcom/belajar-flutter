import 'package:belajar_flutter/blocs/counter1.dart';
import 'package:belajar_flutter/blocs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_multi_provider.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomepage(),
//     );
//   }
// }

// For Bloc Provider or Cubit
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData dark = ThemeData.dark();
  final ThemeData light = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        )
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state ? dark : light,
          home: const MyHomepage(),
        ),
      ),
    );
  }
}
