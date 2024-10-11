class MangaCharacter {
  final String name;
  final String description;

  MangaCharacter({required this.name, this.description = ""});
}

class Manga {
  String title;
  String description;
  String category;
  String rating;
  String genre;
  String creator;
  String dateOfRelease;
  String image;

  List<MangaCharacter> characters;

  Manga({
    required this.title,
    required this.creator,
    this.category = "",
    required this.genre,
    required this.description,
    required this.rating,
    this.dateOfRelease = "",
    this.image = "",
    this.characters = const [],
  });
}
