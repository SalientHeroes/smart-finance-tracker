// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionAdapter extends TypeAdapter<Transaction> {
  @override
  final int typeId = 1;

  @override
  Transaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transaction(
      id: fields[0] as int,
      name: fields[1] as String,
      category: fields[2] as String,
      amount: fields[3] as double,
      date: fields[4] as String,
      source: fields[5] as TransactionSource,
      refId: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Transaction obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.amount)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.source)
      ..writeByte(6)
      ..write(obj.refId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionSourceAdapter extends TypeAdapter<TransactionSource> {
  @override
  final int typeId = 0;

  @override
  TransactionSource read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TransactionSource.manual;
      case 1:
        return TransactionSource.csv;
      case 2:
        return TransactionSource.recurring;
      default:
        return TransactionSource.manual;
    }
  }

  @override
  void write(BinaryWriter writer, TransactionSource obj) {
    switch (obj) {
      case TransactionSource.manual:
        writer.writeByte(0);
        break;
      case TransactionSource.csv:
        writer.writeByte(1);
        break;
      case TransactionSource.recurring:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
