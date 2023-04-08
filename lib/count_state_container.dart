import './count_model.dart';
import 'package:flutter/widgets.dart';

class CountStateContainer extends InheritedWidget {
  final CountModel data;

  const CountStateContainer({
    Key? key,
    required Widget child,
    required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CountStateContainer oldWidget) {
    return data.count.value != oldWidget.data.count.value;
  }

  static CountModel of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CountStateContainer>()!
        .data;
  }
}