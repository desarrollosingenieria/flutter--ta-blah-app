import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:techabla/src/models/favorites_model.dart';

class LocalData {
  var initialized = false;
  Box? favoritesBox;

  Future<bool> init() async {
    var path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FavoriteAdapter());
    }
    return true;
  }

  Future<bool> openBox() async {
    favoritesBox = await Hive.openBox<Favorite>('favorites');
    return true;
  }

  // obtener todas las frases favoritas
  Box? getFavorites() {
    return favoritesBox;
  }

  // guardar frase favorita
  void setFavorite(String text) {
    Favorite favText = Favorite(text: text);
    if (!favoritesBox!.values
        .any((favorite) => favText.text == favorite.text)) {
      favoritesBox!.add(favText);
    }
  }

  // eliminar frase favorita
  void deleteFavorite(int id) {
    favoritesBox!.deleteAt(id);
  }
}
