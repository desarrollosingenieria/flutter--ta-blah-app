import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';

class ButtonWidget extends ConsumerWidget {
  final String title, text;
  final Color color;
  final double height, width, fontSize;
  final Function() onTap;
  final bool expanded;
  const ButtonWidget({
    super.key,
    required this.title,
    required this.text,
    required this.color,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.onTap,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return expanded
        ? Expanded(child: buttonWidget(context, ref))
        : buttonWidget(context, ref);
  }

  Widget buttonWidget(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: color,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: fontSize, //* appParameters.factorSize,
                  fontWeight: FontWeight.bold,
                  color:
                      appParameters.highContrast ? Colors.black : Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
