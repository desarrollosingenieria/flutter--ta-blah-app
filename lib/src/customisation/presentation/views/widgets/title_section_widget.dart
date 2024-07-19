import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleSectionWidget extends ConsumerWidget {
  final String title;
  const TitleSectionWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    final appParameters = ref.watch(customisationControllerProvider);
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: orientation == Orientation.portrait
                ? size.width * appParameters.factorSize
                : size.height * appParameters.factorSize,
            fontWeight: FontWeight.bold,
            color: appParameters.highContrast
                ? Colors.white
                : const Color(0xFF003A70),
          ),
        ),
        SizedBox(
          height: orientation == Orientation.portrait
              ? size.width * 0.04
              : size.height * 0.04,
        ),
      ],
    );
  }
}
