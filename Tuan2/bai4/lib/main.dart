import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final streamController = StreamController<int>();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('StreamBuilder Example'),
        ),
        body: StreamBuilder<int>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Data: ${snapshot.data}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
