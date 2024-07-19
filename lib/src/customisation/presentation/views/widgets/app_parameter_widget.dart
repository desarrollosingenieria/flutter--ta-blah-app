import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppParameterWidget extends ConsumerWidget {
  final String option;
  final String parameter;
  final Function() onTap;
  const AppParameterWidget(
      {super.key,
      required this.option,
      required this.parameter,
      required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(16),
          color: parameter == option
              ? appParameters.highContrast
                  ? Colors.white
                  : Colors.blue
              : appParameters.highContrast
                  ? Colors.transparent
                  : Colors.grey[400],
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 2, color: Colors.white)),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text(
                option,
                style: TextStyle(
                  color: parameter == option
                      ? appParameters.highContrast
                          ? Colors.black
                          : Colors.white
                      : Colors.white,
                  fontSize: orientation == Orientation.portrait
                      ? size.width * appParameters.factorSize
                      : size.height * appParameters.factorSize,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: orientation == Orientation.portrait
              ? size.width * 0.02
              : size.height * 0.02,
        ),
      ],
    );
  }
}
