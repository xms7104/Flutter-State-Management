import './counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MobX',
      home: MyHomePage(
        title: 'Flutter MobX',
        counter: counter,),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title, required this.counter});

  final String title;
  final Counter counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
            onPressed: counter.AddCount,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 50),
          Observer(
              builder: (_) => 
              Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ),
          const SizedBox(width: 50),
          ElevatedButton(
            onPressed: counter.ReduceCount,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.remove),
          ), 
        ],
      ),
    ),
    );
  }
}
