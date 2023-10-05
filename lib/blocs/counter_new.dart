import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterBloc extends Bloc<String, int> {
//   CounterBloc() : super(0);

//   int _counter = 0;
//   int get counter => _counter;

//   Stream<int> mapEventToState(event) async* {
//     if (event == 'add') {
//       _counter++;
//     } else {
//       _counter--;
//     }

//     yield _counter;
//   }
// }

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
