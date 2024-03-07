import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tablah/src/data/local/local_db.dart';
import 'package:tablah/src/models/favorites_model.dart';

part 'favorites_provider.g.dart';

@Riverpod(keepAlive: true)
class AppFavorites extends _$AppFavorites {
  final LocalData _localDB = LocalData();
  @override
  List<Favorite> build() => [];

  Future<bool> openFavoritesBox() async {
    bool result = false;
    await _localDB.openBox().then((isOpenBox) async {
      if (isOpenBox) {
        result = true;
      }
    });
    return result;
  }

  Box getFavorites() {
    return _localDB.favoritesBox!;
  }

  void setFavorite(String text) {
    _localDB.setFavorite(text);
  }

  void deleteFavorite(int index) {
    _localDB.deleteFavorite(index);
  }
}
