import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter State Management',
      home: MyHomePage(title: 'Flutter hooks useState'),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = useState(1);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
            onPressed:() => {counter.value++} ,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 50),
          Text(
            '${counter.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(width: 50),
          ElevatedButton(
            onPressed: () => {
              if(counter.value >1){
                counter.value--
              }},
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
