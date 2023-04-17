import 'package:flutter/material.dart';
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
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              const Text('Volume'),
              Expanded(
                child: Slider(
                  value: ttsProvider.volume,
                  min: 0,
                  max: 1,
                  label: ttsProvider.volume.round().toString(),
                  onChanged: (double value) {
                    ttsProvider.initLanguages();
                    ttsProvider.setVolume(value);
                  },
                ),
              ),
              Text('(${ttsProvider.volume.toStringAsFixed(2)})'),
            ],
          ),
          Row(
            children: <Widget>[
              const Text('Rate'),
              Expanded(
                child: Slider(
                  value: ttsProvider.rate,
                  min: 0,
                  max: 2,
                  label: ttsProvider.rate.round().toString(),
                  onChanged: (double value) {
                    ttsProvider.setRate(value);
                  },
                ),
              ),
              Text('(${ttsProvider.rate.toStringAsFixed(2)})'),
            ],
          ),
          Row(
            children: <Widget>[
              const Text('Pitch'),
              Expanded(
                child: Slider(
                  value: ttsProvider.pitch,
                  min: 0,
                  max: 2,
                  label: ttsProvider.pitch.round().toString(),
                  onChanged: (double value) {
                    ttsProvider.setPitch(value);
                  },
                ),
              ),
              Text('(${ttsProvider.pitch.toStringAsFixed(2)})'),
            ],
          ),
          // Row(
          //   children: <Widget>[
          //     const Text('Language'),
          //     const SizedBox(
          //       width: 20,
          //     ),
          //     DropdownButton<String>(
          //       value: ttsProvider.language,
          //       icon: const Icon(Icons.arrow_downward),
          //       iconSize: 24,
          //       elevation: 16,
          //       style: const TextStyle(color: Colors.deepPurple),
          //       underline: Container(
          //         height: 2,
          //         color: Colors.deepPurpleAccent,
          //       ),
          //       onChanged: (String? newValue) async {
          //         languageCode = await tts.getLanguageCodeByName(newValue!);
          //         voice =
          //             await getVoiceByLang(tts: tts, languageCode: languageCode!);
          //         setState(() {
          //           language = newValue;
          //         });
          //       },
          //       items: languages.map<DropdownMenuItem<String>>((String value) {
          //         return DropdownMenuItem<String>(
          //           value: value,
          //           child: Text(value),
          //         );
          //       }).toList(),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              const Text('Voice'),
              const SizedBox(
                width: 20,
              ),
              Text(ttsProvider.voice ?? '-'),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          InkWell(
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
        ],
      ),
    );
  }
}
