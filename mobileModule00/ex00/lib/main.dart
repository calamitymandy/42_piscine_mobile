// Everything is a widget, and you build your UI by nesting them

// Import Flutter's Material Design library
// gives access to all the standard widgets (buttons, text, scaffold, etc.).
import 'package:flutter/material.dart';

//  Every Dart program starts at main(). runApp() takes a widget and makes it the root of the app.
void main() {
  runApp(const MyApp());
}

//  MyApp is the app itself. It extends StatelessWidget because it has no state 
//— it never changes. MaterialApp is the top-level Flutter widget
//  that sets up navigation, themes, etc. It points to HomePage as the first screen.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

/* This is the actual page:
  - Scaffold — the basic page structure (body, appBar, etc.)
  - Center — centers its child both horizontally and vertically on screen
  - Column — stacks widgets vertically; mainAxisSize: MainAxisSize.min makes 
  it only as tall as its children, so Center can do its job
  - Text — displays text
  - SizedBox(height: 20) — just an empty box for spacing between the text and the button
  - ElevatedButton — a raised button; onPressed is the callback that runs when clicked
  - debugPrint('Button pressed') — prints to the debug console
*/
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'A basic display',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                debugPrint('Button pressed');
              },
              child: const Text('Press me'),
            ),
          ],
        ),
      ),
    );
  }
}
