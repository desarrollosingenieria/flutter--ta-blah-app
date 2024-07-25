import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tablah/core/errors/failures.dart';
import 'package:tablah/src/favorites/data/models/favorites_model.dart';
import 'package:tablah/src/favorites/domain/entities/favorite.dart';

abstract class FavoritesLocalDataSource {
  Future<bool> addFavorite(Favorite fav);
  Future<bool> removeFavorite(int id);
  List<Favorite> get getAllFavorites;
}

class HiveFavoritesLocalDataSource implements FavoritesLocalDataSource {
  HiveFavoritesLocalDataSource() {
    Hive.initFlutter();
  }

  @override
  Future<bool> addFavorite(Favorite favorite) async {
    try {
      Box<dynamic> box = await Hive.openBox('favorites');
      debugPrint(favorite.text);
      box.add(FavoriteModel.fromEntity(favorite).toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure(message: e.toString());
    }
  }

  @override
  Future<bool> removeFavorite(int id) async {
    try {
      Box<dynamic> box = await Hive.openBox('favorites');
      box.deleteAt(id);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure(message: e.toString());
    }
  }

  @override
  List<Favorite> get getAllFavorites {
    try {
      return Hive.box('favorites')
          .values
          .map((favorite) => FavoriteModel.fromJson(favorite))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure(message: e.toString());
    }
  }
}
