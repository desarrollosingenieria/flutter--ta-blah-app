import 'package:flutter/material.dart';
import 'package:techabla/src/data/local/user_preferences.dart';
import 'package:text_to_speech/text_to_speech.dart';

class TTSProvider with ChangeNotifier {
  final String _defaultLanguage = 'en-US';
  final TextToSpeech _tts = TextToSpeech();
  final prefs = UserPreferences();
  double _volume = 1; // Range: 0-1
  double _rate = 1.0; // Range: 0-2
  double _pitch = 1.0; // Range: 0-2

  String? _language;
  String? _languageCode;
  List<String> _languages = <String>[];
  List<String> _languageCodes = <String>[];
  String? voice;

  Future<void> initLanguages() async {
    _volume = prefs.volume;
    _rate = prefs.rate;
    _pitch = prefs.pitch;

    /// populate lang code (i.e. en-US)
    _languageCodes = await _tts.getLanguages();

    /// populate displayed language (i.e. English)
    final List<String>? displayLanguages = await _tts.getDisplayLanguages();
    if (displayLanguages == null) {
      return;
    }

    _languages.clear();
    for (final dynamic lang in displayLanguages) {
      _languages.add(lang as String);
    }

    final String? defaultLangCode = await _tts.getDefaultLanguage();
    if (defaultLangCode != null && _languageCodes.contains(defaultLangCode)) {
      _languageCode = defaultLangCode;
    } else {
      _languageCode = _defaultLanguage;
    }
    _language = await _tts.getDisplayLanguageByCode(_languageCode!);

    /// get voice
    voice = await getVoiceByLang();
  }

  Future<String?> getVoiceByLang() async {
    final List<String>? voices = await _tts.getVoiceByLang(_languageCode!);
    if (voices != null && voices.isNotEmpty) {
      return voices.first;
    }
    return null;
  }

  void speak({required String text}) async {
    await _tts.setVolume(_volume);
    await _tts.setRate(_rate);
    if (_languageCode != null) {
      await _tts.setLanguage(_languageCode!);
    }
    await _tts.setPitch(_pitch);
    await _tts.speak(text);
  }

  void setVolume(double volume) {
    _volume = volume;
    prefs.volume = volume;
    notifyListeners();
  }

  void setPitch(double pitch) {
    _pitch = pitch;
    prefs.pitch = pitch;
    notifyListeners();
  }

  void setRate(double rate) {
    _rate = rate;
    prefs.rate = rate;
    notifyListeners();
  }

  String get defaultLanguage => _defaultLanguage;
  String? get language => _language;
  String? get languageCode => _languageCode;
  double get pitch => _pitch;
  double get rate => _rate;
  double get volume => _volume;
  TextToSpeech get tts => _tts;
}
