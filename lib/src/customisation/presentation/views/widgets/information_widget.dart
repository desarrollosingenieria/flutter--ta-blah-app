import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InformationWidget extends ConsumerWidget {
  const InformationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            DEVELOPED_BY,
            style: TextStyle(
              fontSize: orientation == Orientation.portrait
                  ? size.width * 0.6 * appParameters.factorSize
                  : size.height * 0.6 * appParameters.factorSize,
              color: appParameters.highContrast
                  ? Colors.white
                  : const Color(0xFF003A70),
            ),
          ),
          SizedBox(
            height: orientation == Orientation.portrait
                ? size.width * 0.02
                : size.height * 0.02,
          ),
          Text(
            AUTHOR_APP,
            style: TextStyle(
              fontSize: orientation == Orientation.portrait
                  ? size.width * 0.8 * appParameters.factorSize
                  : size.height * 0.8 * appParameters.factorSize,
              color: appParameters.highContrast
                  ? Colors.white
                  : const Color(0xFF003A70),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: orientation == Orientation.portrait
                ? size.width * 0.08
                : size.height * 0.08,
          ),
        ],
      ),
    );
  }
}
