import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tablah/src/theme/color_app.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData? _selectedTheme;
  ThemeMode? _themeMode;

  ThemeData day = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    //
    // TEXTS
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        //fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: ColorApp.primaryDark,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        //fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: ColorApp.primaryDark,
      ),
      displaySmall: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        //fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: ColorApp.primaryDark,
      ),
      titleSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        //fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: ColorApp.primaryLight,
      ),
    ),

    //fontFamily: 'Poppins',

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(ColorApp.primaryLight),
        shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all<Color>(ColorApp.padua),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 20)),
      ),
    ),

    colorScheme: const ColorScheme(
      primary: ColorApp.primaryLight,
      primaryContainer: ColorApp.secondaryLight,
      onPrimaryContainer: ColorApp.tertiaryLight,
      //primaryVariant: Colores.primarioNight,
      secondary: ColorApp.azure,
      surface: ColorApp.primaryLight,
      background: Colors.deepOrange,
      error: Colors.greenAccent,
      tertiary: ColorApp.padua,
      //secondaryVariant: Colors.yellowAccent,
      brightness: Brightness.light,
      onBackground: Colors.red,
      onError: Colors.blue,
      onPrimary: ColorApp.primaryDark,
      onSecondary: Colors.green,
      onSurface: ColorApp.primaryDark,
    ),

    canvasColor: ColorApp.secondaryLight,
    scaffoldBackgroundColor: ColorApp.primaryLight,
    primaryColor: ColorApp.primaryLight,
    shadowColor: ColorApp.secondaryLight,
    dividerColor: ColorApp.secondaryLight,
    hoverColor: ColorApp.primaryDark, // color de contraste
    highlightColor: ColorApp.secondaryLight, // resaltados y tabs
    dialogBackgroundColor: ColorApp.primaryLight,
    primaryColorDark: ColorApp.primaryDark,
  );

  ThemeData night = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    //
    // TEXTS
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: ColorApp.primaryLight,
      ),
      displayMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: ColorApp.primaryLight,
      ),
      displaySmall: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        fontStyle: FontStyle.normal,
        color: ColorApp.primaryLight,
      ),
    ),
    //
    //
    //fontFamily: 'Poppins',

    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(ColorApp.primaryLight),
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(ColorApp.padua),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 20)),
    )),
    //
    //
    colorScheme: const ColorScheme(
      primary: ColorApp.primaryDark,
      primaryContainer: ColorApp.secondaryDark,
      onPrimaryContainer: ColorApp.tertiaryDark,
      secondary: ColorApp.azure,
      surface: ColorApp.primaryDark,
      background: Colors.deepOrange,
      error: Colors.greenAccent,
      tertiary: ColorApp.padua,
      brightness: Brightness.dark,
      onBackground: Colors.red,
      onError: Colors.blue,
      onPrimary: ColorApp.primaryDark,
      onSecondary: Colors.green,
      onSurface: ColorApp.primaryLight,
    ),

    scaffoldBackgroundColor: ColorApp.primaryDark,
    primaryColor: ColorApp.primaryDark,
    cardColor: ColorApp.primaryDark,
    canvasColor: ColorApp.secondaryDark,
    dividerColor: ColorApp.secondaryDark,
    hoverColor: ColorApp.primaryLight,
    hintColor: ColorApp.primaryDark,
    shadowColor: ColorApp.primaryDark,
    highlightColor: ColorApp.tertiaryDark,
    dialogBackgroundColor: ColorApp.primaryDark,
    primaryColorDark: ColorApp.primaryLight,
  );

  ThemeProvider({required String themeMode}) {
    switch (themeMode) {
      case 'dark':
        _themeMode = ThemeMode.dark;
        break;
      case 'light':
        _themeMode = ThemeMode.light;
        break;
      case 'system':
        _themeMode = ThemeMode.system;
        break;
      default:
        _themeMode = ThemeMode.light;
        break;
    }
  }

  void setThemeMode({required ThemeMode themeMode}) {
    _themeMode = themeMode;
    notifyListeners();
  }

  ThemeData? get getTheme => _selectedTheme;
  ThemeMode? get themeMode => _themeMode;
}
