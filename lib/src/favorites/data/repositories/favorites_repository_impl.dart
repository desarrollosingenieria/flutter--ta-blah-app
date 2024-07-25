import 'package:dartz/dartz.dart';
import 'package:tablah/core/errors/failures.dart';
import 'package:tablah/src/favorites/data/data_sources/local/favorites_local_data_source.dart';
import 'package:tablah/src/favorites/domain/entities/favorite.dart';
import 'package:tablah/src/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localDataSource;

  FavoritesRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> addFavorite(Favorite favorite) async {
    try {
      final bool result = await localDataSource.addFavorite(favorite);
      return Right(result);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to add favorite'));
    }
  }

  @override
  Future<Either<Failure, bool>> removeFavorite(int id) async {
    try {
      final bool result = await localDataSource.removeFavorite(id);
      return Right(result);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to get favorites'));
    }
  }

  @override
  Either<Failure, List<Favorite>> get getAllFavorites {
    try {
      final List<Favorite> favorites = localDataSource.getAllFavorites;
      return Right(favorites);
    } on LocalFailure {
      return Left(LocalFailure(message: 'Failed to get favorites'));
    }
  }
}
