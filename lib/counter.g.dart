part of 'counter.dart';

mixin _$Counter on _Counter, Store {
  final _$valueAtom = Atom(name: '_Counter.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  // ignore: non_constant_identifier_names
  final _$_CounterActionController = ActionController(name: '_Counter');

  @override
  void AddCount() {
    final _$actionInfo = _$_CounterActionController.startAction();
    try {
      return super.AddCount();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  void ReduceCount() {
    final _$actionInfo = _$_CounterActionController.startAction();
    try {
      return super.ReduceCount();
    } finally {
      _$_CounterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'value: ${value.toString()}';
    return '{$string}';
  }
}