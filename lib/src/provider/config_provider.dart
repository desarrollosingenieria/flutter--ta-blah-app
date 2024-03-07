import 'package:flutter/material.dart';
import 'package:tablah/src/data/local/user_preferences.dart';

const int largeScreenSize = 1000;
const int mediumScreenSize = 680;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class ConfigProvider with ChangeNotifier {
  final prefs = UserPreferences();
  double? _factorSize;
  String? _factorText;
  bool? _highlightFont;
  bool? _highContrast;

  void initConfig() {
    _factorSize = prefs.factorSize;
    _factorText = prefs.factorText;
    _highContrast = prefs.highContrast;
  }

  void setFactorSize(double size, String factorText) {
    
    if (factorText == 'grande') {
      prefs.factorText = 'grande';
      _factorText = 'grande';
      prefs.factorSize = size > mediumScreenSize ? 0.04 : 0.08;
      _factorSize = size > mediumScreenSize ? 0.04 : 0.08;
    } else if (factorText == 'predeterminado') {
      prefs.factorText = 'predeterminado';
      _factorText = 'predeterminado';
      prefs.factorSize = size > mediumScreenSize ? 0.036 : 0.06;
      _factorSize = size > mediumScreenSize ? 0.036 : 0.06;
    } else {
      prefs.factorText = 'pequeño';
      prefs.factorSize = size > mediumScreenSize ? 0.03 : 0.054;
      _factorSize = size > mediumScreenSize ? 0.03 : 0.054;
      _factorText = 'pequeño';
    }

    notifyListeners();
  }

  void setHighlightFont(bool status) {
    _highlightFont = status;
    prefs.highlightFont = status;
    notifyListeners();
  }

  void setHighContrast(bool status) {
    _highContrast = status;
    prefs.highContrast = status;
    notifyListeners();
  }

  double? get factorSize => _factorSize;
  String? get factorText => _factorText;
  bool? get highlightFont => _highlightFont ?? false;
  bool? get highContrast => _highContrast ?? false;
}
