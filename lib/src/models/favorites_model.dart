import 'package:hive/hive.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 0)
class Favorite {
  @HiveField(0)
  String text;

  Favorite({
    required this.text,
  });
}
