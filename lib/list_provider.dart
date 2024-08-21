import 'package:flutter/material.dart';

// Using inheritance with 'extends' to call ChangeNotifier

class NumbersListProvider extends ChangeNotifier {
  List<int> numbers = [1, 2, 3, 4, 5];

  void add() {
    int last = numbers.last;
    numbers.add(last + 1);
    // without this the screen will not be updated or show the results
    notifyListeners();
  }
}
