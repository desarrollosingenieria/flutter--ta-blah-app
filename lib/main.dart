import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:techabla/src/data/local/user_preferences.dart';
import 'package:techabla/src/pages/app.dart';
import 'package:techabla/src/provider/tts_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // orientacion vertical
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final prefs = UserPreferences();
  await prefs.initPrefs();
  // statusbar transparente
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TTSProvider(),
        ),
      ],
      child: const TecHabla(),
    ),
  );
}
