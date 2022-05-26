import 'package:flutter/cupertino.dart';

class BottomNavigationProvider with ChangeNotifier {
  int selectedIndex = 0;

  setIndex(int index) {
    if (index > 3 || index < 0) {
      return;
    }
    selectedIndex = index;
    notifyListeners();
  }
}
