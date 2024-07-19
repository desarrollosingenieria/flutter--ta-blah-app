import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:tablah/src/customisation/presentation/views/widgets/app_parameter_widget.dart';
import 'package:tablah/src/customisation/presentation/views/widgets/information_widget.dart';
import 'package:tablah/src/customisation/presentation/views/widgets/title_section_widget.dart';
import 'package:tablah/src/customisation/presentation/views/widgets/voice_button_widget.dart';
import 'package:tablah/src/customisation/presentation/views/widgets/voice_parameter_widget.dart';
import 'package:tablah/src/communication/presentation/providers/voice_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigPage extends ConsumerWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final voiceParameters = ref.watch(voiceControllerProvider);
    return Scaffold(
      backgroundColor: appParameters.highContrast ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text(
          CONFIG_SCREEN_TITLE,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF003A70),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VoiceParameterWidget(
                  option: VOLUME_OPTION_TITLE,
                  parameter: voiceParameters.volume,
                  decrease: () {
                    HapticFeedback.lightImpact();
                    ref.read(voiceControllerProvider.notifier).setVolume(-0.05);
                  },
                  increase: () {
                    HapticFeedback.lightImpact();
                    ref.read(voiceControllerProvider.notifier).setVolume(0.05);
                  }),
              VoiceParameterWidget(
                  option: RATE_OPTION_TITLE,
                  parameter: voiceParameters.rate,
                  decrease: () {
                    HapticFeedback.lightImpact();
                    ref.read(voiceControllerProvider.notifier).setRate(-0.05);
                  },
                  increase: () {
                    HapticFeedback.lightImpact();
                    ref.read(voiceControllerProvider.notifier).setRate(0.05);
                  }),
              VoiceParameterWidget(
                option: PITCH_OPTION_TITLE,
                parameter: voiceParameters.pitch,
                decrease: () {
                  HapticFeedback.lightImpact();
                  ref.read(voiceControllerProvider.notifier).setPitch(-0.05);
                },
                increase: () {
                  HapticFeedback.lightImpact();
                  ref.read(voiceControllerProvider.notifier).setPitch(0.05);
                },
              ),
              const VoiceButtonWidget(),
              const SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    const TitleSectionWidget(
                      title: FACTOR_TEXT_TITLE,
                    ),
                    AppParameterWidget(
                      option: FACTOR_TEXT_SMALL,
                      parameter: appParameters.factorText,
                      onTap: () => ref
                          .read(customisationControllerProvider.notifier)
                          .setFactorText(
                              size: MediaQuery.of(context).size.width,
                              factorText: FACTOR_TEXT_SMALL),
                    ),
                    AppParameterWidget(
                      option: FACTOR_TEXT_DEFAULT,
                      parameter: appParameters.factorText,
                      onTap: () => ref
                          .read(customisationControllerProvider.notifier)
                          .setFactorText(
                              size: MediaQuery.of(context).size.width,
                              factorText: FACTOR_TEXT_DEFAULT),
                    ),
                    AppParameterWidget(
                      option: FACTOR_TEXT_BIG,
                      parameter: appParameters.factorText,
                      onTap: () => ref
                          .read(customisationControllerProvider.notifier)
                          .setFactorText(
                              size: MediaQuery.of(context).size.width,
                              factorText: FACTOR_TEXT_BIG),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    const TitleSectionWidget(
                      title: DESIGN_TITLE,
                    ),
                    AppParameterWidget(
                      option: DEFAULT_DESIGN_OPTION,
                      parameter: appParameters.highContrast
                          ? HIGH_CONTRAST_OPTION
                          : DEFAULT_DESIGN_OPTION,
                      onTap: () => ref
                          .read(customisationControllerProvider.notifier)
                          .setHighContrast(highContrast: false),
                    ),
                    AppParameterWidget(
                      option: HIGH_CONTRAST_OPTION,
                      parameter: appParameters.highContrast
                          ? HIGH_CONTRAST_OPTION
                          : DEFAULT_DESIGN_OPTION,
                      onTap: () => ref
                          .read(customisationControllerProvider.notifier)
                          .setHighContrast(highContrast: true),
                    ),
                  ],
                ),
              ),
              const InformationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
