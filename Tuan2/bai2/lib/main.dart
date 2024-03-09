import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder'),
        ),
        body: FutureBuilder<int>(
          future: calculate(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Result: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }

  Future<int> calculate() async {
    await Future.delayed(Duration(seconds: 2));
    return 42;
  }
}
