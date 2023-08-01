import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techabla/src/views/pages/configPage/config_page.dart';
import 'package:techabla/src/views/pages/homePage/widgets/buttons_widget.dart';
import 'package:techabla/src/views/pages/homePage/widgets/field_text.dart';
import 'package:techabla/src/utils/transitions.dart';
import 'package:techabla/src/provider/config_provider.dart';
import 'package:techabla/src/provider/favorites_provider.dart';
import 'package:techabla/src/provider/tts_provider.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'TecHabla',
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
                  const FieldTextWidget(),
                  SizedBox(
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? null
                        : MediaQuery.of(context).size.height * 0.04,
                  ),
                  const ButtonsWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
