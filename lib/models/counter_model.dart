import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  /// update the counter
  set counter(int value) {
    _counter = value;

    // notify listeners so that the observers can have the latest data
    notifyListeners();
  }
}
