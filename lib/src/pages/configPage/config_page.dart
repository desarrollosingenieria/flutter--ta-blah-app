import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:techabla/src/provider/tts_provider.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ttsProvider = Provider.of<TTSProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configuraciones',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF003A70),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
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
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003A70),
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
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: ttsProvider.volume > 0.05
                            ? const Color(0xFF003A70)
                            : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      '${(ttsProvider.volume * 100).round()}',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF003A70),
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
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: ttsProvider.volume < 1
                            ? const Color(0xFF003A70)
                            : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Velocidad',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003A70),
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
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: ttsProvider.rate > 0.05
                            ? const Color(0xFF003A70)
                            : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      '${(ttsProvider.rate * 100).round()}',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF003A70),
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
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: ttsProvider.rate < 1
                            ? const Color(0xFF003A70)
                            : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Tono',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003A70),
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
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: ttsProvider.pitch > 0.05
                            ? const Color(0xFF003A70)
                            : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      '${(ttsProvider.pitch * 100).round()}',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.normal,
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
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: MediaQuery.of(context).size.width * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: ttsProvider.pitch < 1
                            ? const Color(0xFF003A70)
                            : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            Container(
              alignment: Alignment.center,
              child: InkWell(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Probar voz'.toUpperCase(),
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                onTap: () {
                  ttsProvider.speak(text: 'Esto es una prueba de voz');
                },
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Desarrollado por'.toUpperCase(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      color: Color(0xFF003A70),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    'Clínica de Tecnología Asistiva, FLENI',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      color: Color(0xFF003A70),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.08,
                  ),
                  Image.asset(
                    'assets/images/fleni-logo.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.08,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
