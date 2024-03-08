import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/src/data/local/user_preferences.dart';
import 'package:tablah/src/provider/config_provider.dart';
import 'package:tablah/src/utils/transitions.dart';
import 'package:tablah/src/views/pages/favoritesPage/favorites_page.dart';

class FieldTextWidget extends ConsumerStatefulWidget {
  const FieldTextWidget({super.key});
  @override
  FieldTextWidgetState createState() => FieldTextWidgetState();
}

class FieldTextWidgetState extends ConsumerState<FieldTextWidget> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appConfig = ref.watch(configProvider);

    final UserPreferences prefs = UserPreferences();
    return MediaQuery.of(context).orientation != Orientation.portrait
        ? Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: () {
                    textEditingController.clear();
                    ref.read(configProvider.notifier).setText('');
                  },
                  controller: textEditingController,
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
                      color:
                          appConfig.highContrast ? Colors.white : Colors.black,
                    ),
                  ),
                  onChanged: (String newText) {
                    ref.read(configProvider.notifier).setText(newText);
                  },
                ),
              ),
              SizedBox(
                width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.02
                        : MediaQuery.of(context).size.height * 0.02,
              ),
              Material(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orange,
                child: InkWell(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      FadeTransitionRoute(
                        widget: const FavoritesPage(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
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
                          'Favoritos'.toUpperCase(),
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
                            color: Colors.white,
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
                onTap: () {
                  textEditingController.clear();
                  ref.read(configProvider.notifier).setText('');
                },
                controller: textEditingController,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              1.4 *
                              appConfig.factorSize
                          : MediaQuery.of(context).size.height *
                              1.4 *
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
                          color:
                              prefs.highContrast ? Colors.white : Colors.black,
                          width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                          color:
                              prefs.highContrast ? Colors.white : Colors.black,
                          width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      borderSide: BorderSide(
                          color:
                              prefs.highContrast ? Colors.white : Colors.black,
                          width: 2),
                    ),
                    hintText: 'Escribe algo...',
                    hintStyle: TextStyle(
                      color: prefs.highContrast ? Colors.white : Colors.black,
                    )),
                onChanged: (String newText) {
                  ref.read(configProvider.notifier).setText(newText);
                },
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.02
                        : MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    color:
                        appConfig.highContrast ? Colors.yellow : Colors.orange,
                    child: InkWell(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        Navigator.push(
                          context,
                          FadeTransitionRoute(
                            widget: const FavoritesPage(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite,
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
                              'Favoritos'.toUpperCase(),
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
