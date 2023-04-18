import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:techabla/src/data/local/user_preferences.dart';

class TTSProvider with ChangeNotifier {
  final String _defaultLanguage = 'en-US';
  final FlutterTts _tts = FlutterTts();
  final prefs = UserPreferences();
  double _volume = 1; // Range: 0-1
  double _rate = 0.5; // Range: 0-2
  double _pitch = 1; // Range: 0-2

  String? _language;
  String? _languageCode;
  String? voice;

  Future<void> initLanguages() async {
    //List<Object?> _languages = await _tts.getLanguages;
    _tts.setLanguage("es-US");
    _pitch = prefs.pitch;
    _rate = prefs.rate;
    _volume = prefs.volume;
  }

  void speak({required String text}) async {
    await _tts.speak(text);
  }

  Future<void> setVolume(double volume) async {
    if (_volume + volume > 0 && _volume + volume <= 1) {
      _volume += volume;
      prefs.volume = double.parse(_volume.toStringAsFixed(2));
      await _tts.setVolume(_volume);
      notifyListeners();
    }
  }

  Future<void> setPitch(double pitch) async {
    if (_pitch + pitch > 0 && _pitch + pitch <= 1) {
      _pitch += pitch;
      prefs.pitch = _pitch;
      await _tts.setPitch(_pitch);
      notifyListeners();
    }
  }

  Future<void> setRate(double rate) async {
    if (_rate + rate > 0 && _rate + rate <= 1) {
      _rate += rate;
      prefs.rate = _rate;
      await _tts.setSpeechRate(_rate);
      notifyListeners();
    }
  }

  String get defaultLanguage => _defaultLanguage;
  String? get language => _language;
  String? get languageCode => _languageCode;
  double get pitch => _pitch;
  double get rate => _rate;
  double get volume => _volume;
  FlutterTts get tts => _tts;
}
