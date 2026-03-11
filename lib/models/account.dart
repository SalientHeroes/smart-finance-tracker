enum AccountType { savings, ewallet, credit, cash }

class Account {
  final int id;
  final String name;
  final AccountType type;
  final double openingBalance;
  final double creditLimit;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.openingBalance,
    this.creditLimit = 0,
  });

  Account copyWith({
    int? id,
    String? name,
    AccountType? type,
    double? openingBalance,
    double? creditLimit,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      openingBalance: openingBalance ?? this.openingBalance,
      creditLimit: creditLimit ?? this.creditLimit,
    );
  }
}