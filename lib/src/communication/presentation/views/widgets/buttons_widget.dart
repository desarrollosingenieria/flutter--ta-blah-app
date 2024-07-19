import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/src/communication/presentation/providers/voice_controller.dart';
import 'package:tablah/src/communication/presentation/views/widgets/button_widget.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';

class ButtonsWidget extends ConsumerWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final voiceParameters = ref.watch(voiceControllerProvider);
    return MediaQuery.of(context).orientation != Orientation.portrait
        ? Row(
            children: [
              Expanded(
                child: ButtonWidget(
                  title: COMMUNICATE_BUTTON,
                  text: voiceParameters.text,
                  color: appParameters.highContrast ? Colors.white : Colors.blue,
                  width: MediaQuery.of(context).size.width,
                              
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
                    child:  ButtonWidget(
                      title: YES_TEXT,
                      text: YES_TEXT,
                      color: appParameters.highContrast ? Colors.yellow : Colors.green,
                      width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.18
                              : MediaQuery.of(context).size.height * 0.5,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.04
                        : MediaQuery.of(context).size.height * 0.04,
                  ),
                  Expanded(
                    child: ButtonWidget(
                      title: NO_TEXT,
                      text: NO_TEXT,
                      color: appParameters.highContrast ? Colors.purple : Colors.red,
                      width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.18
                              : MediaQuery.of(context).size.height * 0.5,
                    )
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
                    color: appParameters.highContrast ? Colors.white : Colors.blue,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          COMMUNICATE_BUTTON,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width *
                                      2.4 *
                                      appParameters.factorSize
                                  : MediaQuery.of(context).size.height *
                                      2.4 *
                                      appParameters.factorSize,
                              fontWeight: FontWeight.bold,
                              color: appParameters.highContrast
                                  ? Colors.black
                                  : Colors.white),
                        ),
                      ),
                      onTap: () {
                        if (voiceParameters.text != '') {
                          HapticFeedback.lightImpact();
                          ref
                              .read(voiceControllerProvider.notifier)
                              .speak(text: voiceParameters.text);
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
                      color:
                          appParameters.highContrast ? Colors.yellow : Colors.green,
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
                                        appParameters.factorSize
                                    : MediaQuery.of(context).size.height *
                                        2.8 *
                                        appParameters.factorSize,
                                fontWeight: FontWeight.bold,
                                color: appParameters.highContrast
                                    ? Colors.black
                                    : Colors.white),
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ref.read(voiceControllerProvider.notifier).speak(text: YES_TEXT);
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
                      color:
                          appParameters.highContrast ? Colors.purple : Colors.red,
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
                                        appParameters.factorSize
                                    : MediaQuery.of(context).size.height *
                                        2.8 *
                                        appParameters.factorSize,
                                fontWeight: FontWeight.bold,
                                color: appParameters.highContrast
                                    ? Colors.black
                                    : Colors.white),
                          ),
                        ),
                        onTap: () {
                          HapticFeedback.lightImpact();
                          ref.read(voiceControllerProvider.notifier).speak(text: NO_TEXT);
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
