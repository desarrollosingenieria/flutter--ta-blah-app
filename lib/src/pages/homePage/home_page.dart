import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:techabla/src/pages/configPage/config_page.dart';
import 'package:techabla/src/pages/favoritesPage/favorites_page.dart';
import 'package:techabla/src/pages/utils/transitions.dart';
import 'package:techabla/src/provider/config_provider.dart';
import 'package:techabla/src/provider/favorites_provider.dart';
import 'package:techabla/src/provider/tts_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  TecHablaState createState() => TecHablaState();
}

class TecHablaState extends State<HomePage> {
  String text = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingController.text = text;
    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    ttsProvider.initLanguages();
    final favProvider = Provider.of<FavoritesProvider>(context, listen: false);
    favProvider.openFavoritesBox();
    final configProvider = Provider.of<ConfigProvider>(context, listen: false);
    configProvider.initConfig();
  }

  @override
  Widget build(BuildContext context) {
    final ttsProvider = Provider.of<TTSProvider>(context);
    final configProvider = Provider.of<ConfigProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'TecHabla',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width *
                  configProvider.factorSize!,
              fontWeight: FontWeight.bold,
              color: Colors.white),
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
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    onTap: () {
                      textEditingController.clear();
                    },
                    controller: textEditingController,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          1.4 *
                          configProvider.factorSize!,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    minLines: 2,
                    maxLines: 2,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Escribe algo...'),
                    onChanged: (String newText) {
                      setState(() {
                        text = newText;
                      });
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                            height: MediaQuery.of(context).size.width * 0.16,
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  'Favoritos'.toUpperCase(),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.68 *
                                            configProvider.factorSize!,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 0.74,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(alignment: Alignment.center, children: [
                            Image.asset('assets/images/hablar.png'),
                            Text(
                              'Hablar'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      2.4 *
                                      configProvider.factorSize!,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ]),
                        ),
                        onTap: () {
                          if (textEditingController.text.isNotEmpty) {
                            HapticFeedback.lightImpact();
                            ttsProvider.speak(text: text);
                          }
                          final FocusScopeNode focus = FocusScope.of(context);
                          if (!focus.hasPrimaryFocus && focus.hasFocus) {
                            FocusManager.instance.primaryFocus!.unfocus();
                          }
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Material(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                'Si'.toUpperCase(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            2.8 *
                                            configProvider.factorSize!,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              HapticFeedback.lightImpact();
                              ttsProvider.speak(text: 'Sí');
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      Expanded(
                        child: Material(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                'No'.toUpperCase(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            2.8 *
                                            configProvider.factorSize!,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            onTap: () {
                              HapticFeedback.lightImpact();
                              ttsProvider.speak(text: 'No');
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
