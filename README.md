# 42_piscine_mobile


import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonApp());
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyButton());
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button ex00')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Press the button below!'),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                debugPrint('Button pressed');
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}


## Module 0

### ex00

flutter create ex00 — this is the standard Flutter command that generates a new project with all the boilerplate files (pubspec.yaml, lib/main.dart, platform folders, etc.) inside a folder called ex00.

We Replace the generated lib/main.dart with the actual ex00 solution — a simple page with a
centered text widget and a button that prints "Button pressed" to the debug console when clicked.

The subject says "create a new ex00 project using the tools provided by the framework" — flutter create is exactly that tool. Then you write your code inside lib/main.dart, which is the app's entry point.