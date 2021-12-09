import 'package:flutter/material.dart';

import 'event_channel_manager.dart';
import 'method_channel_manager.dart';
import 'model/dog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final methodChannelManager = MethodChannelManager();
  final eventChannelManager = EventChannelManager();
  final Dog dog = const Dog(name: 'Azor', age: 10, race: 'Golden Retriever');

  MyApp({Key? key}) : super(key: key);

  List<Widget> _buildButtons(BuildContext context) => <Widget>[
        ElevatedButton(
            onPressed: () => methodChannelManager.showAlert(dog.name),
            child: const Text('[Method Handler] Show native alert')),
        const SizedBox(height: 40),
        ElevatedButton(
            onPressed: () async {
              final cat = await methodChannelManager.transformDogIntoCat(dog);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Transformed cat: ${cat?.name} ${cat?.age} ${cat?.color}',
                  textAlign: TextAlign.center,
                ),
              ));
            },
            child: const Text(
              '[Method Handler] Show info returned from native side\n<Transform dog into cat>',
              textAlign: TextAlign.center,
            )),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            eventChannelManager.getRandomNumberStream.listen((randomNumber) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Random number: $randomNumber'),
              ));
            });
          },
          child: const Text(
            '[Event Listener] Listen for changes from native side\n<Show random number every 5 seconds>',
            textAlign: TextAlign.center,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Implementation Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('How to write platform specific code?'),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildButtons(context),
            ),
          ),
        ),
      ),
    );
  }
}
