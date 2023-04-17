import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techabla/src/pages/configPage/config_page.dart';
import 'package:techabla/src/pages/favoritesPage/favorites_page.dart';
import 'package:techabla/src/pages/utils/transitions.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final ttsProvider = Provider.of<TTSProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'TecHabla',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
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
            children: <Widget>[
              TextField(
                onTap: () {
                  textEditingController.clear();
                },
                controller: textEditingController,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.1,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                minLines: 2,
                maxLines: 2,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Escribe algo...'),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        FadeTransitionRoute(
                          widget: const FavoritesPage(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.orange,
                      ),
                      height: MediaQuery.of(context).size.width * 0.16,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            'Favoritos'.toUpperCase(),
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.74,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.blue,
                    ),
                    child: Stack(alignment: Alignment.center, children: [
                      Image.asset('assets/images/hablar.png'),
                      Text(
                        'Hablar'.toUpperCase(),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ]),
                  ),
                  onTap: () {
                    ttsProvider.speak(text: text);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.green,
                        ),
                        child: Text(
                          'Si'.toUpperCase(),
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        ttsProvider.speak(text: 'Sí');
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  Expanded(
                    child: InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                        ),
                        child: Text(
                          'No'.toUpperCase(),
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      onTap: () {
                        ttsProvider.speak(text: 'No');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
