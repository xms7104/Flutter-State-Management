import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'counter_model.dart';

void main() => runApp(MyApp(
      model: CounterModel(),
    ));

class MyApp extends StatelessWidget {
  final CounterModel model;

 const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: model,
      child: MaterialApp(
        title: 'Flutter Scoped Modele',
        home: MyHomePage(title: 'Flutter Scoped Modele'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

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
          ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, child, model) {
              return ElevatedButton(
            onPressed: model.addCount,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.add),
          );
          }),
          const SizedBox(width: 50),
           ScopedModelDescendant<CounterModel>(
            builder: (context, child, model) {
            return Text(
            model.counter.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          );}),
          
          const SizedBox(width: 50),
           ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, child, model) {
            return ElevatedButton(
            onPressed: model.reduceCount,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.remove),
          );
          }),
        ],
      ),
    ),
    );
  }
}