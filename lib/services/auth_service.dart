import '../data/mock_users.dart';
import '../models/user.dart';
import '../data/mock_tasks.dart';
import '../models/task.dart';

class AuthService {
  //dang nhap
  static User? login(String email, String password) {
    try {
      //tim user trong mockUsers co email va password trung khop
      User user = mockUsers.firstWhere(
        (u) => u.email == email && u.password == password,
      );

      return user;
    } catch (e) {
      //neu khong tim thay user nao thi tra ve null
      return null;
    }
  }

  //lay danh sach task cua user
  static List<Task> getUserTasks(String userId) {
    return mockTasks.where((t) => t.userId == userId).toList();
  }
}
