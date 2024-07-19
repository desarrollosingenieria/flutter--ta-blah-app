import 'package:dartz/dartz.dart';
import 'package:tablah/core/errors/failures.dart';
import 'package:tablah/src/favorites/domain/entities/favorite.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, bool>> addFavorite(Favorite fav);
  Future<Either<Failure, bool>> removeFavorite(int id);
  Either<Failure, List<Favorite>> get getAllFavorites;
}