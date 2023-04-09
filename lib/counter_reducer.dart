import './counter_actions.dart';
import './counter_state.dart';

CounterState reducer(CounterState prev, dynamic action) {
  if (action == Actions.Increment) {
    return CounterState(prev.counter + 1);
  } else if (action == Actions.Decrement && prev.counter >0) {
    return CounterState(prev.counter - 1);
  } else {
    return prev;
  }
}
