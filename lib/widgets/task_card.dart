import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Function(Task) onToggle;

  const TaskCard({super.key, required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Image.asset(task.image, width: 40, height: 40),

        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.completed ? TextDecoration.lineThrough : null,
          ),
        ),

        subtitle: Text(
          "${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}",
        ),

        trailing: Checkbox(
          value: task.completed,
          onChanged: (_) {
            onToggle(task);
          },
        ),
      ),
    );
  }
}
