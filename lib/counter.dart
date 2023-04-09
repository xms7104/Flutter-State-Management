import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

abstract class _Counter with Store {
  @observable
  int value = 1;

  @action
  void AddCount() {
    value++;
  }

  @action
  void ReduceCount() {
    if(value >1){
      value--;
    }
  }
}