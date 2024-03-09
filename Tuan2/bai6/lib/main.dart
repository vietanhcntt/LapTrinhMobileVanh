import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _currentInput = '';
  String _operator = '';
  double _result = 0.0;

  void _handleButtonPress(String value) {
    setState(() {
      if (value == 'C') {
        _currentInput = '';
        _operator = '';
        _result = 0.0;
        _output = '0';
      } else if (value == '=') {
        if (_operator.isNotEmpty && _currentInput.isNotEmpty) {
          double currentValue = double.parse(_currentInput);
          switch (_operator) {
            case '+':
              _result += currentValue;
              break;
            case '-':
              _result -= currentValue;
              break;
            case 'x':
              _result *= currentValue;
              break;
            case '/':
              if (currentValue != 0) {
                _result /= currentValue;
              } else {
                _output = 'Error';
                return;
              }
              break;
            default:
              break;
          }
          _output = _result.toString();
          _currentInput = '';
          _operator = '';
        }
      } else if (value == '+' || value == '-' || value == 'x' || value == '/') {
        if (_currentInput.isNotEmpty) {
          _operator = value;
          _result = double.parse(_currentInput);
          _currentInput = '';
        }
      } else {
        _currentInput += value;
        _output = _currentInput;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  var buttonText = '';
                  if (index == 0) {
                    buttonText = 'C';
                  } else if (index == 1) {
                    buttonText = '+/-';
                  } else if (index == 2) {
                    buttonText = '%';
                  } else if (index == 3) {
                    buttonText = '/';
                  } else if (index == 4) {
                    buttonText = '7';
                  } else if (index == 5) {
                    buttonText = '8';
                  } else if (index == 6) {
                    buttonText = '9';
                  } else if (index == 7) {
                    buttonText = 'x';
                  } else if (index == 8) {
                    buttonText = '4';
                  } else if (index == 9) {
                    buttonText = '5';
                  } else if (index == 10) {
                    buttonText = '6';
                  } else if (index == 11) {
                    buttonText = '-';
                  } else if (index == 12) {
                    buttonText = '1';
                  } else if (index == 13) {
                    buttonText = '2';
                  } else if (index == 14) {
                    buttonText = '3';
                  } else if (index == 15) {
                    buttonText = '+';
                  } else if (index == 16) {
                    buttonText = '0';
                  } else if (index == 17) {
                    buttonText = '.';
                  } else if (index == 18) {
                    buttonText = '=';
                  }

                  return TextButton(
                    onPressed: () {
                      _handleButtonPress(buttonText);
                    },
                    child: Text(
                      buttonText,
                      style: TextStyle(fontSize: 24.0),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
