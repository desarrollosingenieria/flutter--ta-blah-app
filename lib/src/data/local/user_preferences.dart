import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de pitch
  double get pitch {
    return _prefs.getDouble('pitch') ?? 1.0;
  }

  set pitch(double value) {
    _prefs.setDouble('pitch', value);
  }

  // GET y SET de rate
  double get rate {
    return _prefs.getDouble('rate') ?? 1.0;
  }

  set rate(double value) {
    _prefs.setDouble('rate', value);
  }

  // GET y SET de volume
  double get volume {
    return _prefs.getDouble('volume') ?? 1.0;
  }

  set volume(double value) {
    _prefs.setDouble('volume', value);
  }

  // GET y SET de languageCode
  String get languageCode {
    return _prefs.getString('languageCode') ?? '';
  }

  set languageCode(String code) {
    _prefs.setString('languageCode', code);
  }

  // GET y SET de language
  String get language {
    return _prefs.getString('language') ?? '';
  }

  set languagee(String lang) {
    _prefs.setString('language', lang);
  }

  Future<bool> cleanPrefs() async {
    return _prefs.clear();
  }
}
