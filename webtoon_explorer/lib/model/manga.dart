import 'package:hive/hive.dart';

part 'manga.g.dart'; // This is necessary for Hive to know where to generate the code.

@HiveType(typeId: 0) // Assign a unique type ID for this model
class MangaCharacter {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String image;

  MangaCharacter({
    required this.name,
    this.image = "",
    this.description = "",
  });
}

@HiveType(typeId: 1) // Assign another type ID for the Manga model
class Manga {
  @HiveField(0)
  String title;

  @HiveField(1)
  String category;

  @HiveField(2)
  String rating;

  @HiveField(3)
  String dateOfRelease;

  @HiveField(4)
  String image;

  @HiveField(5)
  String banner;

  @HiveField(6)
  late List<String> description;

  @HiveField(7)
  late List<String> genre;

  @HiveField(8)
  late List<String> creator;

  @HiveField(9)
  List<MangaCharacter> characters;

  Manga({
    required this.title,
    required String creator,
    this.category = "",
    required String genre,
    required String description,
    required this.rating,
    this.dateOfRelease = "",
    this.image = "",
    this.banner = "",
    this.characters = const [],
  }) {
    this.creator = creator.split(",");
    this.genre = genre.split(",");
    this.description = description.split("|");

    for (var i = 0; i < this.genre.length; i++) {
      this.genre[i] = this.genre[i].trim();
      this.genre[i] = this.genre[i].toLowerCase();
    }

    for (var i = 0; i < this.creator.length; i++) {
      this.creator[i] = this.creator[i].trim();
      this.creator[i] = this.creator[i].toLowerCase();
    }

    for (var i = 0; i < this.description.length; i++) {
      this.description[i] = this.description[i].trim();
      this.description[i] = this.description[i].toLowerCase();
    }
  }

  bool containsGenre(String genre) {
    return this.genre.contains(genre);
  }
}
