import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablah/core/constants/constants.dart';
import 'package:tablah/src/communication/presentation/providers/voice_controller.dart';
import 'package:tablah/src/customisation/presentation/providers/customisation_controller.dart';
import 'package:tablah/src/favorites/presentation/providers/favorites_controller.dart';
import 'package:tablah/src/favorites/presentation/views/widgets/add_favorite_widget.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    final favoritesController = ref.watch(favoritesControllerProvider);
    return Scaffold(
        backgroundColor:
            appParameters.highContrast ? Colors.black : Colors.white,
        appBar: AppBar(
          title: const Text(
            FAVORITES_SCREEN_TITLE,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF003A70),
          centerTitle: true,
          elevation: 0,
        ),
        body: CustomScrollView(slivers: [
          const SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: AddFavoriteWidget(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverToBoxAdapter(
              child: Text(
                FAVORITES_TEXT,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              appParameters.factorSize
                          : MediaQuery.of(context).size.height *
                              appParameters.factorSize,
                  fontWeight: FontWeight.bold,
                  color: appParameters.highContrast
                      ? Colors.white
                      : const Color(0xFF003A70),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: favoritesController.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  background: Container(
                    alignment: Alignment.centerRight,
                    color:
                        appParameters.highContrast ? Colors.purple : Colors.red,
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
                      ref
                          .read(favoritesControllerProvider.notifier)
                          .removeFavorite(id: index);
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      ref
                          .read(voiceControllerProvider.notifier)
                          .speak(text: favoritesController[index].text);
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
                          favoritesController[index].text,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? MediaQuery.of(context).size.width *
                                    0.8 *
                                    appParameters.factorSize
                                : MediaQuery.of(context).size.height *
                                    0.8 *
                                    appParameters.factorSize,
                            color: appParameters.highContrast
                                ? Colors.white
                                : const Color(0xFF003A70),
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
        ]));
  }
}
