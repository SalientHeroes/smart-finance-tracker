class Budget {
  final int id;
  final String category;
  final String categoryLabel;
  final double limit;
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