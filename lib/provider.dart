import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  Brightness _currentBrightness = Brightness.light;
  Color _textColor = Colors.black;
  int _idx = 0;
  ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  Brightness get currentBrightness => _currentBrightness;
  Color get textColor => _textColor;
  int get idx => _idx;

  setBrightness() {
    if (_currentBrightness == Brightness.light) {
      _currentBrightness = Brightness.dark;
      _textColor = Colors.white;
    } else {
      _currentBrightness = Brightness.light;
      _textColor = Colors.black;
    }
    notifyListeners();
  }

  setPageIdx(int idx) {
    _idx = idx;
    currentPageNotifier.value = idx;
    notifyListeners();
  }
}
