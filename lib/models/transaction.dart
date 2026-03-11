
enum TransactionSource { manual, csv, recurring }

class Transaction {
  final int id;
  final String name;
  final String category;
  final double amount;
  final String date;
  final TransactionSource source;
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