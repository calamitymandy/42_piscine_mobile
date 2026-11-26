import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false, // Hide debug banner
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _expression = '0';
  String _result = '0';

  // Evaluate the expression and update _result
  void _calculate() {
    try {
      // Replace display symbols with math_expressions compatible ones
      String exp = _expression;

      // Reject expressions ending with an operator or dot
      if (RegExp(r'[+\-*/\.]$').hasMatch(exp)) {
        setState(() { _result = 'Error'; });
        return;
      }

      Parser parser = Parser();
      Expression expression = parser.parse(exp);
      ContextModel cm = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, cm);

      // Handle division by zero and infinity
      if (eval.isInfinite || eval.isNaN) {
        setState(() { _result = 'Error'; });
        return;
      }

      // Show as integer if no decimal part, otherwise show decimal
      setState(() {
        _result = eval % 1 == 0 ? eval.toInt().toString() : eval.toString();
      });
    } catch (e) {
      setState(() { _result = 'Error'; });
    }
  }

  // Handle button presses
  void _onButton(String text) {
    debugPrint(text);
    setState(() {
      if (text == 'AC') {
        // Clear everything
        _expression = '0';
        _result = '0';
      } else if (text == 'C') {
        // Delete last character
        if (_expression.length <= 1) {
          _expression = '0';
        } else {
          _expression = _expression.substring(0, _expression.length - 1);
        }
      } else if (text == '=') {
        _calculate();
      } else {
        // Append digit/operator/dot
        if (_expression == '0' && text != '.') {
          // Replace leading zero unless adding a decimal
          _expression = text;
        } else {
          _expression += text;
        }
      }
    });
  }

  Widget buildButton(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () {
            _onButton(text);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(0, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((button) => buildButton(button)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  TextField(
                    readOnly: true,
                    textAlign: TextAlign.right,
                    controller: TextEditingController(text: _expression),
                    decoration: const InputDecoration(
                      labelText: 'Expression',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 12),

                  TextField(
                    readOnly: true,
                    textAlign: TextAlign.right,
                    controller: TextEditingController(text: _result),
                    decoration: const InputDecoration(
                      labelText: 'Result',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: Column(
                      children: [
                        buildButtonRow(['AC', 'C', '/', '*']),
                        buildButtonRow(['7', '8', '9', '-']),
                        buildButtonRow(['4', '5', '6', '+']),
                        buildButtonRow(['1', '2', '3', '=']),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              buildButton('0', flex: 2),
                              buildButton('.'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
