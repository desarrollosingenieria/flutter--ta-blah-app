import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/core/utils/transitions.dart';
import 'package:tablah/src/communication/presentation/providers/voice_controller.dart';
import 'package:tablah/src/communication/presentation/views/widgets/button_widget.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:tablah/src/favorites/presentation/views/pages/favorites_page.dart';

class ButtonsWidget extends ConsumerWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final voiceParameters = ref.watch(voiceControllerProvider);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > MEDIUM_SCREEN_SIZE) {
        return Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  ButtonWidget(
                    title: COMMUNICATE_BUTTON,
                    text: voiceParameters.text,
                    expanded: true,
                    color:
                        appParameters.highContrast ? Colors.white : Colors.blue,
                    height: 100.h,
                    width: 100.w,
                    fontSize: 16.sp,
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
                  ButtonWidget(
                      title: FAVORITES_BUTTON,
                      text: voiceParameters.text,
                      expanded: false,
                      color: appParameters.highContrast
                          ? Colors.yellow
                          : Colors.orange,
                      height: 15.h,
                      width: 100.w,
                      fontSize: 16.sp,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        Navigator.push(
                          context,
                          FadeTransitionRoute(
                            widget: const FavoritesPage(),
                          ),
                        );
                      }),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: YES_TEXT,
                  text: YES_TEXT,
                  expanded: true,
                  color:
                      appParameters.highContrast ? Colors.yellow : Colors.green,
                  width: 20.w,
                  height: 100.w,
                  fontSize: 16.sp,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ref
                        .read(voiceControllerProvider.notifier)
                        .speak(text: YES_TEXT);

                    final FocusScopeNode focus = FocusScope.of(context);
                    if (!focus.hasPrimaryFocus && focus.hasFocus) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }
                  },
                ),
                ButtonWidget(
                  title: NO_TEXT,
                  text: NO_TEXT,
                  expanded: true,
                  color:
                      appParameters.highContrast ? Colors.purple : Colors.red,
                  width: 20.w,
                  height: 100.w,
                  fontSize: 16.sp,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ref
                        .read(voiceControllerProvider.notifier)
                        .speak(text: NO_TEXT);

                    final FocusScopeNode focus = FocusScope.of(context);
                    if (!focus.hasPrimaryFocus && focus.hasFocus) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }
                  },
                )
              ],
            ),
          ],
        );
      } else {
        return Column(
          children: [
            ButtonWidget(
              title: COMMUNICATE_BUTTON,
              text: voiceParameters.text,
              expanded: true,
              color: appParameters.highContrast ? Colors.white : Colors.blue,
              width: 100.w,
              height: 100.h,
              fontSize: 20.sp,
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
            ButtonWidget(
                title: FAVORITES_BUTTON,
                text: voiceParameters.text,
                expanded: false,
                color:
                    appParameters.highContrast ? Colors.yellow : Colors.orange,
                width: 100.w,
                height: 10.h,
                fontSize: 20.sp,
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.push(
                    context,
                    FadeTransitionRoute(
                      widget: const FavoritesPage(),
                    ),
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: YES_TEXT,
                  text: YES_TEXT,
                  expanded: true,
                  color:
                      appParameters.highContrast ? Colors.yellow : Colors.green,
                  width: 100.w,
                  height: 20.h,
                  fontSize: 20.sp,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ref
                        .read(voiceControllerProvider.notifier)
                        .speak(text: YES_TEXT);

                    final FocusScopeNode focus = FocusScope.of(context);
                    if (!focus.hasPrimaryFocus && focus.hasFocus) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }
                  },
                ),
                ButtonWidget(
                  title: NO_TEXT,
                  text: NO_TEXT,
                  expanded: true,
                  color:
                      appParameters.highContrast ? Colors.purple : Colors.red,
                  width: 100.w,
                  height: 20.h,
                  fontSize: 20.sp,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ref
                        .read(voiceControllerProvider.notifier)
                        .speak(text: NO_TEXT);

                    final FocusScopeNode focus = FocusScope.of(context);
                    if (!focus.hasPrimaryFocus && focus.hasFocus) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }
                  },
                )
              ],
            )
          ],
        );
      }
    });
  }
}
