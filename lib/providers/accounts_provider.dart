import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/account.dart';

class AccountsNotifier extends StateNotifier<List<Account>> {
  AccountsNotifier() : super([]) {
    _loadFromHive();
  }

  static const _boxName = 'accounts';

  Future<void> _loadFromHive() async {
    final box = await Hive.openBox<Account>(_boxName);
    state = box.values.toList();
  }

  Future<void> addAccount(Account account) async {
    final box = await Hive.openBox<Account>(_boxName);
    await box.put(account.id, account);
    state = box.values.toList();
  }

  Future<void> editAccount(Account updated) async {
    final box = await Hive.openBox<Account>(_boxName);
    await box.put(updated.id, updated);
    state = box.values.toList();
  }

  Future<void> deleteAccount(int id) async {
    final box = await Hive.openBox<Account>(_boxName);
    await box.delete(id);
    state = box.values.toList();
  }
}

final accountsProvider = StateNotifierProvider<AccountsNotifier, List<Account>>((ref) {
  return AccountsNotifier();
});