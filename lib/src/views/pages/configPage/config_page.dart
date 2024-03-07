import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablah/src/data/local/user_preferences.dart';
import 'package:tablah/src/provider/config_provider.dart';
import 'package:tablah/src/provider/tts_provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    final ttsProvider = Provider.of<TTSProvider>(context);
    final configProvider = Provider.of<ConfigProvider>(context);
    final UserPreferences prefs = UserPreferences();
    Size mq = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: prefs.highContrast ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text(
          'Configuraciones',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF003A70),
        centerTitle: true,
        elevation: 0,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Volumen',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * configProvider.factorSize!
                              : mq.height * configProvider.factorSize!,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          ttsProvider.setVolume(-0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: ttsProvider.volume > 0.05
                                ? prefs.highContrast ? Colors.white : const Color(0xFF003A70)
                                : prefs.highContrast ? Colors.black : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: prefs.highContrast ? Colors.black : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: orientation == Orientation.portrait
                            ? mq.width * 0.3
                            : mq.height * 0.3,
                        child: Text(
                          '${(ttsProvider.volume * 100).round()}',
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? mq.width * configProvider.factorSize!
                                : mq.height * configProvider.factorSize!,
                            fontWeight: FontWeight.normal,
                            color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ttsProvider.setVolume(0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: ttsProvider.volume < 1
                                ? prefs.highContrast ? Colors.white : const Color(0xFF003A70)
                                : prefs.highContrast ? Colors.black : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: prefs.highContrast ? Colors.black : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.04
                      : mq.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Velocidad',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * configProvider.factorSize!
                              : mq.height * configProvider.factorSize!,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          ttsProvider.setRate(-0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: ttsProvider.rate > 0.05
                                ? prefs.highContrast ? Colors.white : const Color(0xFF003A70)
                                : prefs.highContrast ? Colors.black : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: prefs.highContrast ? Colors.black : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: orientation == Orientation.portrait
                            ? mq.width * 0.3
                            : mq.height * 0.3,
                        child: Text(
                          '${(ttsProvider.rate * 100).round()}',
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? mq.width * configProvider.factorSize!
                                : mq.height * configProvider.factorSize!,
                            fontWeight: FontWeight.normal,
                            color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ttsProvider.setRate(0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: ttsProvider.rate < 1
                                ? prefs.highContrast ? Colors.white : const Color(0xFF003A70)
                                : prefs.highContrast ? Colors.black : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: prefs.highContrast ? Colors.black : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.04
                      : mq.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Tono',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * configProvider.factorSize!
                              : mq.height * configProvider.factorSize!,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          ttsProvider.setPitch(-0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: ttsProvider.pitch > 0.05
                                ? prefs.highContrast ? Colors.white : const Color(0xFF003A70)
                                : prefs.highContrast ? Colors.black :Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: prefs.highContrast ? Colors.black : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: orientation == Orientation.portrait
                            ? mq.width * 0.3
                            : mq.height * 0.3,
                        child: Text(
                          '${(ttsProvider.pitch * 100).round()}',
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? mq.width * configProvider.factorSize!
                                : mq.height * configProvider.factorSize!,
                            fontWeight: FontWeight.normal,
                            color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ttsProvider.setPitch(0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: ttsProvider.pitch < 1
                                ? prefs.highContrast ? Colors.white : const Color(0xFF003A70)
                                : prefs.highContrast ? Colors.black : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: prefs.highContrast ? Colors.black : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.04
                      : mq.height * 0.04,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    color: prefs.highContrast ? Colors.white : Colors.blue,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        alignment: Alignment.center,
                        width: orientation == Orientation.portrait
                            ? mq.width * 0.6
                            : mq.height * 0.6,
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.2
                            : mq.height * 0.2,
                        child: Text(
                          'Probar voz'.toUpperCase(),
                          style: TextStyle(
                              fontSize: orientation == Orientation.portrait
                                  ? mq.width * 0.68 * configProvider.factorSize!
                                  : mq.height *
                                      0.68 *
                                      configProvider.factorSize!,
                              fontWeight: FontWeight.bold,
                              color: prefs.highContrast ? Colors.black : Colors.white,),
                        ),
                      ),
                      onTap: () {
                        ttsProvider.speak(text: 'Esto es una prueba de voz');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 40),
                  child: Column(
                    children: [
                      Text(
                        'Tamaño de texto',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * configProvider.factorSize!
                              : mq.height * configProvider.factorSize!,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.04
                            : mq.height * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: configProvider.factorText! == 'pequeño'
                                ? prefs.highContrast ? Colors.white : Colors.blue
                                : prefs.highContrast ? Colors.transparent : Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                configProvider.setFactorSize(
                                    mq.width, 'pequeño');
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(width: prefs.highContrast ? 2 : 0, color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Pequeño',
                                  style: TextStyle(
                                    color: configProvider.factorText! == 'pequeño' ? prefs.highContrast ? Colors.black : Colors.white : Colors.white,
                                    fontSize: orientation == Orientation.portrait
                              ? mq.width * configProvider.factorSize!
                              : mq.height * configProvider.factorSize!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: orientation == Orientation.portrait
                                ? mq.width * 0.02
                                : mq.height * 0.02,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color:
                                configProvider.factorText! == 'predeterminado'
                                    ? prefs.highContrast ? Colors.white : Colors.blue
                                    : prefs.highContrast ? Colors.transparent: Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                configProvider.setFactorSize(
                                    mq.width, 'predeterminado');
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(width: prefs.highContrast ? 2 : 0, color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Predeterminado',
                                  style: TextStyle(
                                    color: configProvider.factorText! == 'predeterminado' ? prefs.highContrast ? Colors.black : Colors.white : Colors.white,
                                    fontSize: orientation == Orientation.portrait
                              ? mq.width * configProvider.factorSize!
                              : mq.height * configProvider.factorSize!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: orientation == Orientation.portrait
                                ? mq.width * 0.02
                                : mq.height * 0.02,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: configProvider.factorText! == 'grande'
                                ? prefs.highContrast ? Colors.white : Colors.blue
                                : prefs.highContrast ? Colors.transparent : Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                configProvider.setFactorSize(
                                    mq.width, 'grande');
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(width: prefs.highContrast ? 2 : 0, color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Grande',
                                  style: TextStyle(
                                    color: configProvider.factorText! == 'grande' ? prefs.highContrast ? Colors.black : Colors.white : Colors.white,
                                    fontSize: orientation == Orientation.portrait
                              ? mq.width * configProvider.factorSize!
                              : mq.height * configProvider.factorSize!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.04
                      : mq.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Text(
                        'Diseño de pantalla',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * configProvider.factorSize!
                              : mq.height * configProvider.factorSize!,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.04
                            : mq.height * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: configProvider.highContrast!
                                ? prefs.highContrast ? Colors.transparent : Colors.grey[400]
                                : prefs.highContrast ? Colors.white : Colors.blue,
                            child: InkWell(
                              onTap: () {
                                configProvider.setHighContrast(false);
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(width: prefs.highContrast ? 2 : 0, color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Predeterminado',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: orientation ==
                                            Orientation.portrait
                                        ? mq.width * configProvider.factorSize!
                                        : mq.height *
                                            configProvider.factorSize!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: orientation == Orientation.portrait
                                ? mq.width * 0.02
                                : mq.height * 0.02,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            
                            color: configProvider.highContrast!
                                ? prefs.highContrast ? Colors.white : Colors.blue
                                : prefs.highContrast ? Colors.transparent: Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                configProvider.setHighContrast(true);
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(width: prefs.highContrast ? 2 : 0, color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Alto contraste',
                                  style: TextStyle(
                                    color: prefs.highContrast ? Colors.black : Colors.white,
                                    fontSize: orientation ==
                                            Orientation.portrait
                                        ? mq.width * configProvider.factorSize!
                                        : mq.height *
                                            configProvider.factorSize!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.08
                      : mq.height * 0.08,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Desarrollado por'.toUpperCase(),
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * 0.6 * configProvider.factorSize!
                              : mq.height * 0.6 * configProvider.factorSize!,
                          color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.02
                            : mq.height * 0.02,
                      ),
                      Text(
                        'Clínica de Tecnología Asistiva, FLENI',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * 0.8 * configProvider.factorSize!
                              : mq.height * 0.8 * configProvider.factorSize!,
                          color: prefs.highContrast ? Colors.white : const Color(0xFF003A70),
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.08
                            : mq.height * 0.08,
                      ),
                      // Image.asset(
                      //   'assets/images/fleni-logo.png',
                      //   width: orientation == Orientation.portrait
                      //       ? mq.width * 0.6
                      //       : mq.height * 0.6,
                      // ),
                      // SizedBox(
                      //   height: orientation == Orientation.portrait
                      //       ? mq.width * 0.08
                      //       : mq.height * 0.08,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
