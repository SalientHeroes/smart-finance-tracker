import 'package:hive_flutter/hive_flutter.dart';

part 'budget.g.dart';

@HiveType(typeId: 4)
class Budget {
  @HiveField(0)
  final int id;
  
  @HiveField(1)
  final String category;
  
  @HiveField(2)
  final String categoryLabel;
  
  @HiveField(3)
  final double limit;
  
  @HiveField(4)
  final String? emoji;

  Budget({
    required this.id,
    required this.category,
    required this.categoryLabel,
    required this.limit,
    this.emoji,
  });

  Budget copyWith({
    int? id,
    String? category,
    String? categoryLabel,
    double? limit,
    String? emoji,
  }) {
    return Budget(
      id: id ?? this.id,
      category: category ?? this.category,
      categoryLabel: categoryLabel ?? this.categoryLabel,
      limit: limit ?? this.limit,
      emoji: emoji ?? this.emoji,
    );
  }
}
