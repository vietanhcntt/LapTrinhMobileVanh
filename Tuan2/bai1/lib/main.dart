import 'dart:async';

void main() {
  print('Start');

  calculate().then((result) {
    print('Result: $result');
  });

  print('End');
}

Future<int> calculate() async {
  await Future.delayed(Duration(seconds: 2));
  return 42;
}
