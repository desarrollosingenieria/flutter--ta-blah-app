import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:tablah/src/communication/presentation/providers/voice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceButtonWidget extends ConsumerWidget {
  const VoiceButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: appParameters.highContrast ? Colors.white : Colors.blue,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Text(
              TEST_VOICE_BUTTON,
              style: TextStyle(
                fontSize: orientation == Orientation.portrait
                      ? size.width * appParameters.factorSize
                      : size.height * appParameters.factorSize,
                fontWeight: FontWeight.bold,
                color: appParameters.highContrast ? Colors.black : Colors.white,
              ),
            ),
          ),
          onTap: () {
            ref
                .read(voiceControllerProvider.notifier)
                .speak(text: TEST_VOICE_TEXT);
          },
        ),
      ),
    );
  }
}
