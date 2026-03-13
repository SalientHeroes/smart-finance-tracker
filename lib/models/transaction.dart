import 'package:hive_flutter/hive_flutter.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
enum TransactionSource { 
  @HiveField(0) manual, 
  @HiveField(1) csv, 
  @HiveField(2) recurring, 
  }

@HiveType(typeId: 1)
class Transaction {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String category;
  
  @HiveField(3)
  final double amount;

  @HiveField(4)
  final String date;

  @HiveField(5)
  final TransactionSource source;

  @HiveField(6)
  final String? refId;

  Transaction({
    required this.id,
    required this.name,
    required this.category,
    required this.amount,
    required this.date,
    required this.source,
    this.refId,
  });

  Transaction copyWith({
    int? id,
    String? name,
    String? category,
    double? amount,
    String? date,
    TransactionSource? source,
    String? refId,
  }) {
    return Transaction(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      source: source ?? this.source,
      refId: refId ?? this.refId,
    );
  }
}
