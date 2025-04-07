import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events for the BLoC
abstract class CounterPageEvent {}

class IncrementCounter extends CounterPageEvent {}

// Define the state for the BLoC
class CounterPageState {
  final int counter;

  CounterPageState(this.counter);
}

// Define the BLoC
class CounterPageBloc extends Bloc<CounterPageEvent, CounterPageState> {
  CounterPageBloc() : super(CounterPageState(0)) {
    on<IncrementCounter>((event, emit) {
      emit(CounterPageState(state.counter + 1));
    });
  }
}
