import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tablah/src/views/pages/configPage/config_page.dart';
import 'package:tablah/src/views/pages/homePage/widgets/buttons_widget.dart';
import 'package:tablah/src/views/pages/homePage/widgets/field_text.dart';
import 'package:tablah/src/utils/transitions.dart';
import 'package:tablah/src/provider/config_provider.dart';
import 'package:tablah/src/provider/favorites_provider.dart';
import 'package:tablah/src/provider/tts_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    ttsProvider.initLanguages();
    final favProvider = Provider.of<FavoritesProvider>(context, listen: false);
    favProvider.openFavoritesBox();
    final configProvider = Provider.of<ConfigProvider>(context, listen: false);
    configProvider.initConfig();
  }

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      backgroundColor: configProvider.highContrast! ? Colors.black : Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: MediaQuery.of(context).orientation == Orientation.portrait 
      ? AppBar(
        title: const Text(
          'TA Blah',
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
      ) : const PreferredSize(preferredSize: Size.zero, child: SafeArea(child: SizedBox.shrink(),),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                const FieldTextWidget(),
                SizedBox(
                  height: MediaQuery.of(context).orientation ==
                          Orientation.portrait
                      ? null
                      : MediaQuery.of(context).size.height * 0.04,
                ),
                const Expanded(child: ButtonsWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
