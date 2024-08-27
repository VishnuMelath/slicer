// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoremodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameScoreModelAdapter extends TypeAdapter<GameScoreModel> {
  @override
  final int typeId = 1;

  @override
  GameScoreModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameScoreModel(
      score: fields[0] as int,
      date: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, GameScoreModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.score)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameScoreModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
