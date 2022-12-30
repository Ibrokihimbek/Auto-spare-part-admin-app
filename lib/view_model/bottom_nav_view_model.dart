import 'package:flutter/cupertino.dart';

class BottomNavViewModel extends ChangeNotifier {
  int activePageIndex = 0;

  void changePageIndex(int newIndex) {
    activePageIndex = newIndex;
    notifyListeners();
  }
}