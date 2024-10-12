// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MangaCharacterAdapter extends TypeAdapter<MangaCharacter> {
  @override
  final int typeId = 0;

  @override
  MangaCharacter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MangaCharacter(
      name: fields[0] as String,
      image: fields[2] as String,
      description: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MangaCharacter obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaCharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MangaAdapter extends TypeAdapter<Manga> {
  @override
  final int typeId = 1;

  @override
  Manga read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Manga(
      title: fields[0] as String,
      creator: fields[8].join(","),
      category: fields[1] as String,
      genre: fields[7].join(","),
      description: fields[6].join("|"),
      rating: fields[2] as String,
      dateOfRelease: fields[3] as String,
      image: fields[4] as String,
      banner: fields[5] as String,
      characters: (fields[9] as List).cast<MangaCharacter>(),
    );
  }

  @override
  void write(BinaryWriter writer, Manga obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.dateOfRelease)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.banner)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.genre)
      ..writeByte(8)
      ..write(obj.creator)
      ..writeByte(9)
      ..write(obj.characters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MangaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
