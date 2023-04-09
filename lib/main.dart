import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './counter_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Provider',
        home: MyHomePage(title: 'Flutter Provider'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Consumer<CounterModel>(
            builder: (context, counter, child) =>
            ElevatedButton(
            onPressed: () => Provider.of<CounterModel>(context, listen: false).addCount(),
            //listen: false指state改變時不需要rebuild
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.add),
          )),
          const SizedBox(width: 50),
           Consumer<CounterModel>(
            builder: (context, counter, child) =>
            Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          )),
          const SizedBox(width: 50),
           Consumer<CounterModel>(
            builder: (context, counter, child) =>
            ElevatedButton(
            onPressed: () => Provider.of<CounterModel>(context, listen: false).reduceCount(),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.remove),
          )),
        ],
      ),
    ),
    );
  }
}