import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:tablah/src/data/local/local_db.dart';

class FavoritesProvider with ChangeNotifier {
  String? _favorite;
  final LocalData _localDB = LocalData();

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

  String? get favorite => _favorite;
}
