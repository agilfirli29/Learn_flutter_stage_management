import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => Counter(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Code Sample',
      home: CounterApp(),
    );
  }
}

class Counter with ChangeNotifier {
  int _number = 0;

  int get number => _number;

  void increment() {
    _number++;
    notifyListeners();
  }

  void decrement() {
    _number--;
    notifyListeners();
  }
}

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Sample Code',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text(
            'You have pressed the buttomn ${context.watch<Counter>().number} times.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(), //Menambahkan
        // onPressed: () => context.read<Counter>().decrement(), // Mengurangkan
        tooltip: 'Increment CounterApp',
        child: const Icon(Icons.add),
      ),
    );
  }
}
