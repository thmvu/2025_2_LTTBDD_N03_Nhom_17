class Task {
  final String id;
  final String userId;
  final String title;
  final DateTime createdAt;
  bool completed;

  Task({
    required this.id,
    required this.userId,
    required this.title,
    required this.createdAt,
    this.completed = false,
  });
}
