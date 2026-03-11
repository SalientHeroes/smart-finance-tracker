class Goal {
  final int id;
  final String name;
  final double target;
  final double saved;
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