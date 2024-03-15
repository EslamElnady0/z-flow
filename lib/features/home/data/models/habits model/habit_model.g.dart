// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitModelAdapter extends TypeAdapter<HabitModel> {
  @override
  final int typeId = 2;

  @override
  HabitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitModel(
      iteration: fields[3] as int,
      title: fields[0] as String,
      createdAt: fields[2] as String,
      deadline: fields[1] as String,
      isFavourited: fields[4] as bool,
      isIterable: fields[5] as bool,
      isDone: fields[6] as bool,
      isDoneBefore: fields[7] as bool,
      id: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.deadline)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.iteration)
      ..writeByte(4)
      ..write(obj.isFavourited)
      ..writeByte(5)
      ..write(obj.isIterable)
      ..writeByte(6)
      ..write(obj.isDone)
      ..writeByte(7)
      ..write(obj.isDoneBefore)
      ..writeByte(8)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
