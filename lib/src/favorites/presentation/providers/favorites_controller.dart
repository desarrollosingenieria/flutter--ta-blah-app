
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tablah/src/favorites/application/services/favorites_service.dart';
import 'package:tablah/src/favorites/data/data_sources/local/favorites_local_data_source.dart';
import 'package:tablah/src/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:tablah/src/favorites/domain/entities/favorite.dart';

part 'favorites_controller.g.dart';

@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  late FavoritesService service = FavoritesService(
    repository: FavoritesRepositoryImpl(
      localDataSource: HiveFavoritesLocalDataSource(),
    ),
  );
  List<Favorite> favorites = [];
  
  @override
  List<Favorite> build() => service.favorites;

  Future<bool> addFavorite({required String text}) {
    state = [...state, Favorite(text: text)];
    return service.addFavorite(text);
  }

  Future<bool> removeFavorite({required int id}) {
    state.removeAt(id);
    return service.removeFavorite(id);
  }
  }
