import 'package:flutter/material.dart';
import '../api/auth_api.dart';

class UserProvider extends ChangeNotifier {
  Brightness _currentBrightness = Brightness.light;
  Color _textColor = Colors.black;
  int _idx = 0;
  ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

  String? _jwtToken;
  String? _jwtRefreshToken;

  Brightness get currentBrightness => _currentBrightness;
  Color get textColor => _textColor;
  int get idx => _idx;

  String? get jwtToken => _jwtToken;
  String? get jwtRefreshToken => _jwtRefreshToken;

  Future<Map<String, dynamic>> signIn(Map<String, dynamic> data) async {
    try {
      final Map<String, dynamic> response =
          await AuthAPI.postData('login', data);
      if (response["error"] == null) {
        // print(response);
        _jwtToken = response['token'];
        _jwtRefreshToken = response['refreshToken'];
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> signUp(Map<String, dynamic> data) async {
    try {
      final Map<String, dynamic> response =
          await AuthAPI.postData('register', data);
      if (response["error"] == null) {
        // print(response);
        _jwtToken = response['token'];
        _jwtRefreshToken = response['refreshToken'];
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }

  setJwtToken(String? token) {
    _jwtToken = token;
    notifyListeners();
  }

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
