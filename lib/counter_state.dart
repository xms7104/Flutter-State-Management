class CounterState {
  late int counter;

  CounterState._();

  CounterState(int i, {required this.counter});

  factory CounterState.initial() {
    return CounterState._()..counter = 0;
  }
}
