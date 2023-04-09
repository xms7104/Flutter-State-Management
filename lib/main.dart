import './counter_bloc.dart';
import './counter_event.dart';
import './counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: CounterWidget(
          widget: widget,
        ));
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder(
              bloc: BlocProvider.of<CounterBloc>(context),
              builder: (BuildContext context, CounterState state) {
                return Text(
                  '${state.counter}',
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).add(IncrementEvent()),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).add(DecrementEvent()),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
