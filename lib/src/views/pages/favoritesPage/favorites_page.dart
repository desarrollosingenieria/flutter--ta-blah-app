import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:techabla/src/provider/config_provider.dart';
import 'package:techabla/src/provider/favorites_provider.dart';
import 'package:techabla/src/provider/tts_provider.dart';
import 'package:techabla/src/views/pages/favoritesPage/widgets/add_fav.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoritesProvider>(context);
    final ttsProvider = Provider.of<TTSProvider>(context);
    final configProvider = Provider.of<ConfigProvider>(context);
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Favoritos',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF003A70),
          centerTitle: true,
          elevation: 0,
        ),
        body: ValueListenableBuilder(
          valueListenable: favProvider.getFavorites().listenable(),
          builder: ((context, box, _) {
            return CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(
                    child: AddFavWidget(),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Lista de favoritos',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.width *
                                configProvider.factorSize!
                            : MediaQuery.of(context).size.height *
                                configProvider.factorSize!,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF003A70),
                      ),
                    ),
                  ),
                ),
                SliverFillRemaining(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: UniqueKey(),
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          padding: const EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.delete,
                            size: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.width * 0.06
                                : MediaQuery.of(context).size.height * 0.06,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.endToStart) {
                            favProvider.deleteFavorite(index);
                          }
                        },
                        child: InkWell(
                          onTap: () {
                            HapticFeedback.lightImpact();
                            ttsProvider.speak(text: box.getAt(index).text);
                          },
                          child: ListTile(
                            trailing: Icon(
                              Icons.chevron_left,
                              size: MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? MediaQuery.of(context).size.width * 0.06
                                  : MediaQuery.of(context).size.height * 0.06,
                            ),
                            title: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                box.getAt(index).text,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.portrait
                                          ? MediaQuery.of(context).size.width *
                                              0.8 *
                                              configProvider.factorSize!
                                          : MediaQuery.of(context).size.height *
                                              0.8 *
                                              configProvider.factorSize!,
                                  color: const Color(0xFF003A70),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const Divider(
                        thickness: 2,
                        height: 0,
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
