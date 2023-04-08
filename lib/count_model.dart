import 'package:flutter/cupertino.dart';

class CountModel {
  final ValueNotifier<int> count = ValueNotifier(1);

  void addCount() {
    count.value++;
  }

  void reduceCount() {
    if(count.value >1){
      count.value--;
    }
  }
}