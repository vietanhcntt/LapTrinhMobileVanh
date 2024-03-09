import 'package:flutter/material.dart';

void main() => runApp(TinhTongApp());

class TinhTongApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tính Tổng',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TinhTongScreen(),
    );
  }
}

class TinhTongScreen extends StatefulWidget {
  @override
  _TinhTongScreenState createState() => _TinhTongScreenState();
}

class _TinhTongScreenState extends State<TinhTongScreen> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  int result = 0;

  void calculateSum() {
    int number1 = int.parse(number1Controller.text);
    int number2 = int.parse(number2Controller.text);
    setState(() {
      result = number1 + number2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tính Tổng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Số thứ nhất'),
            ),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Số thứ hai'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateSum,
              child: Text('Tính Tổng'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Kết Quả: $result',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}