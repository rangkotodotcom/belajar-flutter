import 'package:belajar_flutter/blocs/counter_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) => Center(child: Text('$count')),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterCubit>().increment(),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}

// class MyHomepage extends StatelessWidget {
//   const MyHomepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // var bloc = BlocProvider.of<CounterBloc>(context);
//     var bloc = context.read<CounterBloc>();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             BlocBuilder<CounterBloc, int>(
//               builder: (context, state) {
//                 return Text(
//                   (state == bloc.counter)
//                       ? "Angka saat ini : $state"
//                       : "Angka saat ini : ${bloc.counter}",
//                   style: const TextStyle(fontSize: 25),
//                 );
//               },
//             ),
//             const SizedBox(
//               height: 25,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     bloc.add('minus');
//                   },
//                   icon: const Icon(Icons.remove),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     bloc.add('add');
//                   },
//                   icon: const Icon(Icons.add),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
