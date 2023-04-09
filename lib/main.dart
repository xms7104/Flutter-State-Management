import './counter_actions.dart' as action;
import './counter_reducer.dart';
import './counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store<CounterState>(reducer, initialState: CounterState(0));

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: const MaterialApp(
        title: 'Flutter Redux',
        home: MyHomePage(title: 'Flutter Redux'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          StoreConnector<CounterState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(action.Actions.Increment);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                onPressed: callback,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              );
            },
          ),
          const SizedBox(width: 50),
          StoreConnector<CounterState, String>(
            converter: (store) => store.state.counter.toString(),
            builder: (context, count) {
              return Text(
                '$count',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            },
          ),
          const SizedBox(width: 50),
          StoreConnector<CounterState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(action.Actions.Decrement);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                onPressed: callback,
                tooltip: 'Increment',
                child: const Icon(Icons.remove),
              );
            },
          ),
          ],
        ),
      ),
    );
  }
}