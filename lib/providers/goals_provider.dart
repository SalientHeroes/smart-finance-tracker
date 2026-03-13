import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/goal.dart';

class GoalsNotifier extends StateNotifier<List<Goal>> {
  GoalsNotifier() : super([]) {
    _loadFromHive();
  }

  static const _boxName = 'goals';

  Future<void> _loadFromHive() async {
    final box = await Hive.openBox<Goal>(_boxName);
    state = box.values.toList();
  }

  Future<void> addGoal(Goal goal) async {
    final box = await Hive.openBox<Goal>(_boxName);
    await box.put(goal.id, goal);
    state = box.values.toList();
  }

  Future<void> editGoal(Goal updated) async {
    final box = await Hive.openBox<Goal>(_boxName);
    await box.put(updated.id, updated);
    state = box.values.toList();
  }

  Future<void> deleteGoal(int id) async {
    final box = await Hive.openBox<Goal>(_boxName);
    await box.delete(id);
    state = box.values.toList();
  }
}

final goalsProvider = StateNotifierProvider<GoalsNotifier, List<Goal>>((ref) {
  return GoalsNotifier();
});