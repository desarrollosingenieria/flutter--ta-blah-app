import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VoiceParameterWidget extends ConsumerWidget {
  final String option;
  final double parameter;
  final Function() increase, decrease;
  const VoiceParameterWidget(
      {super.key,
      required this.parameter,
      required this.option,
      required this.increase,
      required this.decrease});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final Orientation orientation = MediaQuery.of(context).orientation;
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: <Widget>[
              Text(
                option,
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
              const Spacer(),
              InkWell(
                onTap: decrease,
                borderRadius: BorderRadius.circular(500),
                child: Container(
                  alignment: Alignment.center,
                  width: orientation == Orientation.portrait
                      ? size.width * 0.1
                      : size.height * 0.1,
                  height: orientation == Orientation.portrait
                      ? size.width * 0.1
                      : size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: parameter > 0.05
                        ? appParameters.highContrast
                            ? Colors.white
                            : const Color(0xFF003A70)
                        : appParameters.highContrast
                            ? Colors.black
                            : Colors.grey,
                  ),
                  child: Icon(
                    Icons.chevron_left,
                    color: appParameters.highContrast
                        ? Colors.black
                        : Colors.white,
                    size: orientation == Orientation.portrait
                        ? size.width * 0.06
                        : size.height * 0.06,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: orientation == Orientation.portrait
                    ? size.width * 0.3
                    : size.height * 0.3,
                child: Text(
                  '${(parameter * 100).round()}',
                  style: TextStyle(
                    fontSize: orientation == Orientation.portrait
                        ? size.width * appParameters.factorSize
                        : size.height * appParameters.factorSize,
                    fontWeight: FontWeight.normal,
                    color: appParameters.highContrast
                        ? Colors.white
                        : const Color(0xFF003A70),
                  ),
                ),
              ),
              InkWell(
                onTap: increase,
                borderRadius: BorderRadius.circular(500),
                child: Container(
                  alignment: Alignment.center,
                  width: orientation == Orientation.portrait
                      ? size.width * 0.1
                      : size.height * 0.1,
                  height: orientation == Orientation.portrait
                      ? size.width * 0.1
                      : size.height * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    color: parameter < 1
                        ? appParameters.highContrast
                            ? Colors.white
                            : const Color(0xFF003A70)
                        : appParameters.highContrast
                            ? Colors.black
                            : Colors.grey,
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    color: appParameters.highContrast
                        ? Colors.black
                        : Colors.white,
                    size: orientation == Orientation.portrait
                        ? size.width * 0.06
                        : size.height * 0.06,
                  ),
                ),
              ),
            ],
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
