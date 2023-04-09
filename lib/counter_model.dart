import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  int _counter = 1;
  int get counter => _counter;

  void addCount() {
    _counter++;
    notifyListeners();
  }

  void reduceCount() {
    if(_counter >1){
      _counter--;
    }
    notifyListeners();
  }
}
