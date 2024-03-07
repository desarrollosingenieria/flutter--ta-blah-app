import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/src/data/local/local_db.dart';
import 'package:tablah/src/data/local/user_preferences.dart';
import 'package:tablah/src/app.dart';

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
    const ProviderScope(child: TABlah()),
  );
}
