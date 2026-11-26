import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

/*
Convert HomePage to a StatefulWidget — this splits into two classes:
    - HomePage (the widget itself)
    - _HomePageState (holds the changing data)
Add a boolean variable _showHelloWorld to track which text to display
    - true → show "Hello World!"
    - false → show "A basic display"
Wrap the button's onPressed in setState() — this tells Flutter to
rebuild the UI when the variable changes
Toggle _showHelloWorld each time the button is clicked
Use a ternary operator to pick the right text: _showHelloWorld ? "Hello
  World!" : "A basic display"
  
  The key Dart/Flutter concept:
  - StatelessWidget = never changes after being built
  - StatefulWidget = can change and rebuild when you call setState()
*/
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool showHelloWorld = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              showHelloWorld ? 'Hello World!' : 'A basic display',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showHelloWorld = !showHelloWorld;
                  });
              },
              child: const Text('Press me'),
            ),
          ],
        ),
      ),
    );
  }
}
