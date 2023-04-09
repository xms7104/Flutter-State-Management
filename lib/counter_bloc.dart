import 'package:bloc/bloc.dart';
import './counter_event.dart';
import './counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(100, counter: 1));
  CounterState get initialState => CounterState.initial();

  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(state.counter+ 1,counter: state.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(state.counter- 1,counter: state.counter - 1);
    }
  }
}
