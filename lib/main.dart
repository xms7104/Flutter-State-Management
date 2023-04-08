import 'package:flutter/material.dart';
import './count_model.dart';
import './count_state_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      home: CountStateContainer(
        data: CountModel(),
        child: const MyHomePage(title: 'Flutter InheritedWidget',)
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  didValueChange() => setState(() {});

  @override
  Widget build(BuildContext context) {
    CountStateContainer.of(context).count.addListener(didValueChange);
    //didValueChange是InheritedWidget一種方法，當state改變時則會被調用

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
            onPressed: () => {CountStateContainer.of(context).addCount()},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 50),
          Text(
            '${CountStateContainer.of(context).count.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(width: 50),
          ElevatedButton(
            onPressed: () => {CountStateContainer.of(context).reduceCount()},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.remove),
          ), 
        ],
      ),
    ));
  }
}