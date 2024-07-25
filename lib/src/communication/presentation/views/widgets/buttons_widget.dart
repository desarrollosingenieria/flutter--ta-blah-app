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
    return Expanded(
      child: MediaQuery.of(context).orientation != Orientation.portrait
          ? Row(
              children: [
                ButtonWidget(
                  title: COMMUNICATE_BUTTON,
                  text: voiceParameters.text,
                  expanded: true,
                  color:
                      appParameters.highContrast ? Colors.white : Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  height: double.infinity,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      title: YES_TEXT,
                      text: YES_TEXT,
                      expanded: true,
                      color: appParameters.highContrast
                          ? Colors.yellow
                          : Colors.green,
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.18
                          : MediaQuery.of(context).size.height * 0.5,
                      height: double.infinity,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        ref
                            .read(voiceControllerProvider.notifier)
                            .speak(text: YES_TEXT);
                      },
                    ),
                    ButtonWidget(
                      title: NO_TEXT,
                      text: NO_TEXT,
                      expanded: true,
                      color: appParameters.highContrast
                          ? Colors.purple
                          : Colors.red,
                      width: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.18
                          : MediaQuery.of(context).size.height * 0.5,
                      height: double.infinity,
                      fontSize: 16,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        ref
                            .read(voiceControllerProvider.notifier)
                            .speak(text: NO_TEXT);
                      },
                    )
                  ],
                ),
              ],
            )
          : Column(
              children: [
                ButtonWidget(
                  title: COMMUNICATE_BUTTON,
                  text: voiceParameters.text,
                  expanded: true,
                  color:
                      appParameters.highContrast ? Colors.white : Colors.blue,
                  width: MediaQuery.of(context).size.width,
                  height: double.infinity,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      title: YES_TEXT,
                      text: YES_TEXT,
                      expanded: true,
                      color: appParameters.highContrast
                          ? Colors.yellow
                          : Colors.green,
                      width: double.infinity,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.4
                          : MediaQuery.of(context).size.height * 0.4,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        ref
                            .read(voiceControllerProvider.notifier)
                            .speak(text: YES_TEXT);
                      },
                    ),
                    ButtonWidget(
                      title: NO_TEXT,
                      text: NO_TEXT,
                      expanded: true,
                      color: appParameters.highContrast
                          ? Colors.purple
                          : Colors.red,
                      width: double.infinity,
                      height: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.4
                          : MediaQuery.of(context).size.height * 0.4,
                      fontSize: 16,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        ref
                            .read(voiceControllerProvider.notifier)
                            .speak(text: NO_TEXT);
                      },
                    )
                  ],
                )
              ],
            ),
    );
  }
}
