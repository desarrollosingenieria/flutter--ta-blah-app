import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:techabla/src/data/local/local_db.dart';
import 'package:techabla/src/data/local/user_preferences.dart';
import 'package:techabla/src/app.dart';
import 'package:techabla/src/provider/config_provider.dart';
import 'package:techabla/src/provider/favorites_provider.dart';
import 'package:techabla/src/provider/tts_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // orientacion vertical
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // statusbar transparente
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  final prefs = UserPreferences();
  await prefs.initPrefs();
  final localDB = LocalData();
  await localDB.init();
  await localDB.openBox();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TTSProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => FavoritesProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ConfigProvider(),
        ),
      ],
      child: const TecHabla(),
    ),
  );
}
