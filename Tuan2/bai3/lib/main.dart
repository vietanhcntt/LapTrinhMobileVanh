import 'dart:async';

void main() {
  final streamController = StreamController<int>();

  final stream = streamController.stream;

  stream.listen((data) {
    print('Data: $data');
  });

  streamController.add(1);
  streamController.add(2);
  streamController.add(3);

  streamController.close();
}
