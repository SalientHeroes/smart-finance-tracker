import 'package:hive_flutter/hive_flutter.dart';

part 'goal.g.dart';

@HiveType(typeId: 5)
class Goal {
  @HiveField(0)
  final int id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final double target;
  
  @HiveField(3)
  final double saved;
  
  @HiveField(4)
  final String? deadline;

  Goal({
    required this.id,
    required this.name,
    required this.target,
    required this.saved,
    this.deadline,
  });

  Goal copyWith({
    int? id,
    String? name,
    double? target,
    double? saved,
    String? deadline,
  }) {
    return Goal(
      id: id ?? this.id,
      name: name ?? this.name,
      target: target ?? this.target,
      saved: saved ?? this.saved,
      deadline: deadline ?? this.deadline,
    );
  }
}
