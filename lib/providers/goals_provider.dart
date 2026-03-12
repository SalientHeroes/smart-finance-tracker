import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/goal.dart';

class GoalsNotifier extends StateNotifier<List<Goal>> {
  GoalsNotifier() : super([]);

  void addGoal(Goal goal) {
    state = [...state, goal];
  }

  void editGoal(Goal updated) {
    state = [
      for (final goal in state)
        if (goal.id == updated.id) updated else goal,
    ];
  }

  void deleteGoal(int id) {
    state = state.where((goal) => goal.id != id).toList();
  }
}

final goalsProvider = StateNotifierProvider<GoalsNotifier, List<Goal>>((ref) {
  return GoalsNotifier();
});