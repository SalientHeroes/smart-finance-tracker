import 'package:hive_flutter/hive_flutter.dart';

part 'account.g.dart';

@HiveType(typeId: 2)
enum AccountType { 
  @HiveField(0) savings, 
  @HiveField(1) ewallet, 
  @HiveField(2) credit, 
  @HiveField(3) cash,
  }

@HiveType(typeId: 3)
class Account {
  @HiveField(0)
  final int id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final AccountType type;
  
  @HiveField(3)
  final double openingBalance;
  
  @HiveField(4)
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