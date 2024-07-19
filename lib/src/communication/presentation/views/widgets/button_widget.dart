import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/src/communication/presentation/providers/voice_controller.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';

class ButtonWidget extends ConsumerWidget {
  final String title, text;
  final Color color;
  final double width;
  const ButtonWidget({super.key, required this.title, required this.text, required this.color, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final voiceParameters = ref.watch(voiceControllerProvider);
    return Material(
                    borderRadius: BorderRadius.circular(16),
                    color: color, 
                    
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        alignment: Alignment.center,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          title,
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
                        if (title != COMMUNICATE_BUTTON || voiceParameters.text != '') {
                          HapticFeedback.lightImpact();
                          ref
                              .read(voiceControllerProvider.notifier)
                              .speak(text: text);
                        }
                        final FocusScopeNode focus = FocusScope.of(context);
                        if (!focus.hasPrimaryFocus && focus.hasFocus) {
                          FocusManager.instance.primaryFocus!.unfocus();
                        }
                      },
                    ),
                  );
  }
}