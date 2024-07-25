import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/src/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('appParameters');
  await Hive.openBox('voiceParameters');
  await Hive.openBox('favorites');
  runApp(const ProviderScope(child: TABlah(),),);
}