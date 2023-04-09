import 'package:flutter/material.dart';
import './counter_bloc.dart';
import './counter_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter BLoC',
      home: MyHomePage(title: 'Flutter BLoC',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _bloc.counterEventSink.add(AddEvent()),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.add),
            ),
          const SizedBox(width: 50),
          StreamBuilder(
              stream: _bloc.counter,
              initialData: 1,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
              }),
          const SizedBox(width: 50),
             ElevatedButton(
              onPressed: () => _bloc.counterEventSink.add(ReduceEvent()),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.remove),
            ),
        ],
      ),
    ));
  }
  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
