import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/src/provider/config_provider.dart';
import 'package:tablah/src/provider/favorites_provider.dart';
import 'package:tablah/src/utils/responsive.dart';

class AddFavWidget extends ConsumerWidget {
  const AddFavWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    final appConfig = ref.watch(configProvider);
    return Responsive.isLargeScreen(context)
        ? Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width *
                            1.2 *
                            appConfig.factorSize
                        : MediaQuery.of(context).size.height *
                            1.2 *
                            appConfig.factorSize,
                    fontWeight: FontWeight.bold,
                    color: appConfig.highContrast ? Colors.white : Colors.black,
                  ),
                  minLines: 1,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(
                            color: appConfig.highContrast
                                ? Colors.white
                                : Colors.black,
                            width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(
                            color: appConfig.highContrast
                                ? Colors.white
                                : Colors.black,
                            width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(
                            color: appConfig.highContrast
                                ? Colors.white
                                : Colors.black,
                            width: 2),
                      ),
                      hintText: 'Agregar favoritos...',
                      hintStyle: TextStyle(
                        color: appConfig.highContrast
                            ? Colors.white
                            : Colors.black,
                      )),
                ),
              ),
              SizedBox(
                width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.04
                        : MediaQuery.of(context).size.height * 0.04,
              ),
              Material(
                borderRadius: BorderRadius.circular(16),
                color: appConfig.highContrast ? Colors.white : Colors.blue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      HapticFeedback.lightImpact();
                      ref
                          .read(appFavoritesProvider.notifier)
                          .setFavorite(controller.text);
                      controller.clear();
                      final FocusScopeNode focus = FocusScope.of(context);
                      if (!focus.hasPrimaryFocus && focus.hasFocus) {
                        FocusManager.instance.primaryFocus!.unfocus();
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: appConfig.highContrast
                              ? Colors.black
                              : Colors.white,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.02
                              : MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Agregar'.toUpperCase(),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.width *
                                    0.68 *
                                    appConfig.factorSize
                                : MediaQuery.of(context).size.height *
                                    0.68 *
                                    appConfig.factorSize,
                            fontWeight: FontWeight.bold,
                            color: appConfig.highContrast
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              TextField(
                controller: controller,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              1.2 *
                              appConfig.factorSize
                          : MediaQuery.of(context).size.height *
                              1.2 *
                              appConfig.factorSize,
                  fontWeight: FontWeight.bold,
                  color: appConfig.highContrast ? Colors.white : Colors.black,
                ),
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                          color: appConfig.highContrast
                              ? Colors.white
                              : Colors.black,
                          width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                          color: appConfig.highContrast
                              ? Colors.white
                              : Colors.black,
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                          color: appConfig.highContrast
                              ? Colors.white
                              : Colors.black,
                          width: 2),
                    ),
                    hintText: 'Agregar favoritos...',
                    hintStyle: TextStyle(
                      color:
                          appConfig.highContrast ? Colors.white : Colors.black,
                    )),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.04
                        : MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    color: appConfig.highContrast ? Colors.white : Colors.blue,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        if (controller.text.isNotEmpty) {
                          HapticFeedback.lightImpact();
                          ref
                              .read(appFavoritesProvider.notifier)
                              .setFavorite(controller.text);
                          controller.clear();
                          final FocusScopeNode focus = FocusScope.of(context);
                          if (!focus.hasPrimaryFocus && focus.hasFocus) {
                            FocusManager.instance.primaryFocus!.unfocus();
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: appConfig.highContrast
                                  ? Colors.black
                                  : Colors.white,
                              size: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width * 0.06
                                  : MediaQuery.of(context).size.height * 0.06,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width * 0.02
                                  : MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              'Agregar'.toUpperCase(),
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? MediaQuery.of(context).size.width *
                                        0.68 *
                                        appConfig.factorSize
                                    : MediaQuery.of(context).size.height *
                                        0.68 *
                                        appConfig.factorSize,
                                fontWeight: FontWeight.bold,
                                color: appConfig.highContrast
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
