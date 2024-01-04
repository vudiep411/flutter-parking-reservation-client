import 'package:flutter/material.dart';
import '../api/reserve_api.dart';

class DataProvider with ChangeNotifier {
  String _token = "";
  List<dynamic> availableSpots = [];

  String get token => _token;

  void fetchAvailableSpots() async {
    try {
      availableSpots = await ReserveAPI.fetchData('available_spots');
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  setToken(String tk) {
    _token = tk;
    notifyListeners();
  }
}
