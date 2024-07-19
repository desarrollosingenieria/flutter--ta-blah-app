import 'package:tablah/src/favorites/domain/entities/favorite.dart';

class FavoriteModel extends Favorite {
  FavoriteModel({required super.text});

  factory FavoriteModel.fromJson(Map<dynamic, dynamic> json) {
    return FavoriteModel(
      text: json['text'],
    );
  }

  factory FavoriteModel.fromEntity(Favorite entity) {
    return FavoriteModel(
      text: entity.text,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
    };
  }
}