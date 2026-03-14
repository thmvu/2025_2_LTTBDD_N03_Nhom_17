import 'package:du_an_todolist/const/color.dart';
import 'package:du_an_todolist/data/mock_tasks.dart';
import 'package:du_an_todolist/models/task.dart';
import 'package:du_an_todolist/models/user.dart';
import 'package:du_an_todolist/screens/about_screen.dart';
import 'package:du_an_todolist/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late List<Task> userTasks;

  @override
  void initState() {
    super.initState();
    userTasks = mockTasks.where((t) => t.userId == widget.user.id).toList();
  }

  void _toggleTask(Task task) {
    setState(() {
      task.completed = !task.completed;
    });
  }

  int get completedCount => userTasks.where((t) => t.completed).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Custom_green,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(widget.user.avatar),
              onBackgroundImageError: (_, e) {},
            ),
            const SizedBox(width: 10),
            Text(
              'Xin chào, ${widget.user.name}!',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Đăng xuất',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Login_Screen()),
              );
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [_buildTasksTab(), const AboutScreen()],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: Custom_green,
              onPressed: _showAddTaskDialog,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Custom_green,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_rounded),
            label: 'Nhiệm vụ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Giới thiệu',
          ),
        ],
      ),
    );
  }

  // ── Tab 0: Danh sách nhiệm vụ ──────────────────────────────────────────────
  Widget _buildTasksTab() {
    return Column(
      children: [
        // Progress header
        Container(
          width: double.infinity,
          color: Custom_green,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$completedCount / ${userTasks.length} nhiệm vụ hoàn thành',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: userTasks.isEmpty
                      ? 0
                      : completedCount / userTasks.length,
                  backgroundColor: Colors.white38,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  minHeight: 8,
                ),
              ),
            ],
          ),
        ),

        // Task list
        Expanded(
          child: userTasks.isEmpty
              ? const Center(
                  child: Text(
                    'Chưa có nhiệm vụ nào!',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: userTasks.length,
                  itemBuilder: (context, index) {
                    return _buildTaskCard(userTasks[index]);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildTaskCard(Task task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: GestureDetector(
          onTap: () => _toggleTask(task),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: task.completed ? Custom_green : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: task.completed ? Custom_green : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: task.completed
                ? const Icon(Icons.check, color: Colors.white, size: 18)
                : null,
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: task.completed ? TextDecoration.lineThrough : null,
            color: task.completed ? Colors.grey : Colors.black87,
          ),
        ),
        subtitle: Text(
          _formatDate(task.createdAt),
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
        ),
        trailing: Icon(Icons.drag_handle, color: Colors.grey.shade300),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final diff = DateTime.now().difference(date).inDays;
    if (diff == 0) return 'Hôm nay';
    if (diff == 1) return 'Hôm qua';
    return '$diff ngày trước';
  }

  void _showAddTaskDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text('Thêm nhiệm vụ mới'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Nhập tên nhiệm vụ...',
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Custom_green, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Huỷ', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                setState(() {
                  userTasks.add(
                    Task(
                      id: 't_${DateTime.now().millisecondsSinceEpoch}',
                      userId: widget.user.id,
                      title: controller.text.trim(),
                      createdAt: DateTime.now(),
                    ),
                  );
                });
                Navigator.pop(ctx);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Custom_green),
            child: const Text('Thêm', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
