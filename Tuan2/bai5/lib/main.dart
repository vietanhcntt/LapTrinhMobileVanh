import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinh tong hai man hinh',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyCal(),
    );
  }
}
class MyCal extends StatefulWidget{
  @override
  _MyCalState createState() {
    return _MyCalState();
  }
}

class _MyCalState extends State<MyCal>{
  TextEditingController num1CTR = TextEditingController();
  TextEditingController num2CTR = TextEditingController();
  String kq ='';
  void tinhTOng(){
    double num1 = double.tryParse(num1CTR.text) ?? 0.0;
    double num2 = double.tryParse(num2CTR.text) ?? 0.0;
    double tong = num1+num2;
    setState(() {
      kq = 'Tong: $tong';
    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ManHinhKetQua(kq)),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ung dung tinh tong'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1CTR,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhap so 1'),
            ),
            TextField(
              controller: num2CTR,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Nhap so 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: tinhTOng, child: Text('tinh tong'))
          ],
        ),
      ),
    );
  }
}
class ManHinhKetQua extends StatelessWidget{
  final String kq;
  ManHinhKetQua(this.kq);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ket qua tinh tong"),
      ),
      body: Center(
        child: Text("Ket qua la ${this.kq}",
        style: TextStyle(fontSize: 16,
        fontWeight: FontWeight.bold),),
      ),
    );
  }
  
}

