import 'package:flutter/material.dart';
import 'package:techabla/src/data/local/user_preferences.dart';

class ConfigProvider with ChangeNotifier {
  final prefs = UserPreferences();
  double? _factorSize;

  void initConfig() {
    _factorSize = prefs.factorSize;
  }

  void setFactorSize(double value) {
    prefs.factorSize = value;
    _factorSize = value;
    notifyListeners();
  }

  double? get factorSize => _factorSize;
}
