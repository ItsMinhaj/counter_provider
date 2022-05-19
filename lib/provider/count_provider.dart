import 'package:flutter/cupertino.dart';

class CountProvider with ChangeNotifier {
  int count = 0;
  int timer = 0;

  int get counterValue {
    return count;
  }

  void increment() {
    count++;
    notifyListeners();
  }
}
