import 'dart:async';
import './counter_event.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  int _counter = 1;
  final _counterStateController = BehaviorSubject<int>();

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is AddEvent) {
      _counter++;
    } else if (event is ReduceEvent) {
      if(_counter >1){
        _counter--;
      }
    }
    _counterStateController.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}