import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Dog {
  final String name;
  final int age;

  const Dog(this.name, this.age);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Implementation Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Implementation Test'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: () {}, child: const Text('Show native alert')),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Listen for changes from native code'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
