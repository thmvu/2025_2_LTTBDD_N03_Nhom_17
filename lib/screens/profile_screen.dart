import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:du_an_todolist/models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  final int taskCount;
  const ProfileScreen({super.key, required this.user, this.taskCount = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile'.tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAvatar(),
            const SizedBox(height: 20),
            _buildName(),
            const SizedBox(height: 10),
            _buildEmail(),
            const SizedBox(height: 10),
            _buildTasksCount(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(radius: 50, backgroundImage: AssetImage(user.avatar));
  }

  Widget _buildName() {
    return Text(
      user.name,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildEmail() {
    return Text(user.email, style: const TextStyle(fontSize: 16));
  }

  Widget _buildTasksCount() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4B2EA2), Color(0xFF6C3FD4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4B2EA2).withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            taskCount.toString(),
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'tasks_count_label'.tr(),
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
