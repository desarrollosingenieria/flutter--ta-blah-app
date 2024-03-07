import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tablah/src/data/local/local_db.dart';
import 'package:tablah/src/data/local/user_preferences.dart';
import 'package:tablah/src/app.dart';
import 'package:tablah/src/provider/config_provider.dart';
import 'package:tablah/src/provider/favorites_provider.dart';
import 'package:tablah/src/provider/tts_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // pantalla completa
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // bloqueo orientación para celulares
  //if(getDeviceType() == 'phone'){   
            //  SystemChrome.setPreferredOrientations([
            //     DeviceOrientation. portraitUp,
            //  ]);    
  //      }   
  // orientacion vertical
  //await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
      child: const TABlah(),
    ),
  );
}
