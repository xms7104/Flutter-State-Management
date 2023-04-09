import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int value = 1;

  void addCount() {
    value++;
    notifyListeners();
  }

  void reduceCount() {
    if(value >1){
      value--;
    }
    notifyListeners();
  }
}
