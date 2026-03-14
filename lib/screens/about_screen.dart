import 'package:du_an_todolist/const/color.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dùng trực tiếp SingleChildScrollView (không có Scaffold)
    // vì AboutScreen được nhúng vào HomeScreen qua IndexedStack
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mô tả ứng dụng
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Custom_green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.info_outline,
                          color: Custom_green, size: 22),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Về ứng dụng',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ứng dụng giúp người dùng quản lý công việc cá nhân một cách hiệu quả. '
                  'Cung cấp các tính năng tạo, chỉnh sửa, xóa công việc và theo dõi tiến độ hoàn thành.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Tiêu đề team
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Custom_green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.group, color: Custom_green, size: 22),
              ),
              const SizedBox(width: 10),
              const Text(
                'Team phát triển',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          _buildMemberCard(
            imgPath: 'imgs/anhmeo.jpg',
            name: 'Từ Hữu Minh Vũ',
            role: 'Project Manager',
            description: 'Đảm bảo tiến độ và chất lượng của dự án.',
          ),
          const SizedBox(height: 12),
          _buildMemberCard(
            imgPath: 'imgs/anhmeo1.jpg',
            name: 'Phạm Thị Minh Ngọc',
            role: 'Thành Viên',
            description: 'Phát triển các tính năng cùng với bạn trưởng.',
          ),

          const SizedBox(height: 30),

          Center(
            child: Text(
              '© 2026 Todo List của tôi',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMemberCard({
    required String imgPath,
    required String name,
    required String role,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage(imgPath),
            onBackgroundImageError: (_, e) {},
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Custom_green.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    role,
                    style: TextStyle(
                      fontSize: 12,
                      color: Custom_green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
