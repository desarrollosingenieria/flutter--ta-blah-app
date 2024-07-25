import 'package:tablah/src/favorites/domain/entities/favorite.dart';
import 'package:tablah/src/favorites/domain/repositories/favorites_repository.dart';

class FavoritesService {
  final FavoritesRepository repository;

  FavoritesService({required this.repository});

  List<Favorite> get favorites {
    final result = repository.getAllFavorites;
    return result.fold((l) => throw l, (r) => r);
  }

  Future<bool> addFavorite(String text) async {
    final favorite = Favorite(text: text);
    final result = await repository.addFavorite(favorite);
    return result.fold((l) => throw l, (r) => r);
  }

  Future<bool> removeFavorite(int id) async {
    final result = await repository.removeFavorite(id);
    return result.fold((l) => throw l, (r) => r);
  }
}
