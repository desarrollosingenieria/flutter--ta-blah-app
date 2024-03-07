import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tablah/src/provider/config_provider.dart';
import 'package:tablah/src/provider/tts_provider.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ttsProvider = Provider.of<TTSProvider>(context);
    final configProvider = Provider.of<ConfigProvider>(context);
    return MediaQuery.of(context).orientation != Orientation.portrait
        ? Row(
            children: [
              Expanded(
                child: Material(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Hablar'.toUpperCase(),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.width *
                                    2.4 *
                                    configProvider.factorSize!
                                : MediaQuery.of(context).size.height *
                                    2.4 *
                                    configProvider.factorSize!,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    onTap: () {
                      if (ttsProvider.textToSpeech != '') {
                        HapticFeedback.lightImpact();
                        ttsProvider.speak(text: ttsProvider.textToSpeech);
                      }
                      final FocusScopeNode focus = FocusScope.of(context);
                      if (!focus.hasPrimaryFocus && focus.hasFocus) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.04
                        : MediaQuery.of(context).size.height * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.18
                              : MediaQuery.of(context).size.height * 0.5,
                          
                          child: Text(
                            'Si'.toUpperCase(),
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? MediaQuery.of(context).size.width *
                                        2.8 *
                                        configProvider.factorSize!
                                    : MediaQuery.of(context).size.height *
                                        2.8 *
                                        configProvider.factorSize!,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: 'Sí');
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.04
                        : MediaQuery.of(context).size.height * 0.04,
                  ),
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.red,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.18
                              : MediaQuery.of(context).size.height * 0.5,
                          child: Text(
                            'No'.toUpperCase(),
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? MediaQuery.of(context).size.width *
                                        2.8 *
                                        configProvider.factorSize!
                                    : MediaQuery.of(context).size.height *
                                        2.8 *
                                        configProvider.factorSize!,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: 'No');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    color: configProvider.highContrast! ? Colors.white : Colors.blue,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          'Hablar'.toUpperCase(),
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width *
                                      2.4 *
                                      configProvider.factorSize!
                                  : MediaQuery.of(context).size.height *
                                      2.4 *
                                      configProvider.factorSize!,
                              fontWeight: FontWeight.bold,
                              color: configProvider.highContrast! ? Colors.black : Colors.white),
                        ),
                      ),
                      onTap: () {
                        if (ttsProvider.textToSpeech != '') {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: ttsProvider.textToSpeech);
                        }
                        final FocusScopeNode focus = FocusScope.of(context);
                        if (!focus.hasPrimaryFocus && focus.hasFocus) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Material(
                      color: configProvider.highContrast! ? Colors.yellow : Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.4
                              : MediaQuery.of(context).size.height * 0.4,
                          child: Text(
                            'Si'.toUpperCase(),
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? MediaQuery.of(context).size.width *
                                        2.8 *
                                        configProvider.factorSize!
                                    : MediaQuery.of(context).size.height *
                                        2.8 *
                                        configProvider.factorSize!,
                                fontWeight: FontWeight.bold,
                                color: configProvider.highContrast! ? Colors.black : Colors.white),
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: 'Sí');
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.04
                        : MediaQuery.of(context).size.height * 0.04,
                  ),
                  Expanded(
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: configProvider.highContrast! ? Colors.purple : Colors.red,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.4
                              : MediaQuery.of(context).size.height * 0.4,
                          child: Text(
                            'No'.toUpperCase(),
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? MediaQuery.of(context).size.width *
                                        2.8 *
                                        configProvider.factorSize!
                                    : MediaQuery.of(context).size.height *
                                        2.8 *
                                        configProvider.factorSize!,
                                fontWeight: FontWeight.bold,
                                color: configProvider.highContrast! ? Colors.black : Colors.white),
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ttsProvider.speak(text: 'No');
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
  }
}
