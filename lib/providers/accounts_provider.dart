import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/account.dart';

class AccountsNotifier extends StateNotifier<List<Account>> {
	AccountsNotifier() : super([]);
  
  void addAccount(Account account) {
	  state = [...state, account];
  }

  void editAccount(Account updated) {
    state = [
      for (final account in state)
        if (account.id == updated.id) updated else account,
    ];
  }

  void deleteAccount(int id) {
    state = state.where((account) => account.id != id).toList();
  }
}

final accountsProvider = StateNotifierProvider<AccountsNotifier, List<Account>>((ref) {
	return AccountsNotifier();
});