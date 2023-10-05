import 'package:belajar_flutter/blocs/counter1.dart';
import 'package:belajar_flutter/blocs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterBloc, int>(
              listener: (context, state) {
                if (state > 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Melebihi 10'),
                      duration: Duration(microseconds: 100),
                    ),
                  );
                }
              },
              builder: (context, state) => Text(
                "Angka saat ini : $state",
                style: const TextStyle(fontSize: 23),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => context.read<CounterBloc>().decrement(),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => context.read<CounterBloc>().increment(),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeBloc>().changeTheme(),
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
