import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/core/utils/transitions.dart';
import 'package:tablah/src/communication/presentation/views/widgets/buttons_widget.dart';
import 'package:tablah/src/communication/presentation/views/widgets/field_text.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:tablah/src/customisation/presentation/views/pages/config_page.dart';

class CommunicationPage extends ConsumerWidget {
  const CommunicationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    return Scaffold(
      backgroundColor: appParameters.highContrast ? Colors.black : Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          HOME_SCREEN_TITLE,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF003A70),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                FadeTransitionRoute(
                  widget: const ConfigPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const FieldTextWidget(),
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? null
                        : MediaQuery.of(context).size.height * 0.04,
              ),
              const Expanded(child: ButtonsWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
