import '../models/task.dart';

List<Task> mockTasks = [
  // USER 1
  Task(
    id: "t1",
    userId: "u1",
    title: "Làm Bài Tập",
    image: "imgs/study.png",
    createdAt: DateTime.now().subtract(Duration(days: 1)),
    completed: true,
  ),

  Task(
    id: "t2",
    userId: "u1",
    title: "Giặt đồ",
    image: "imgs/laundry.png",
    createdAt: DateTime.now().subtract(Duration(days: 2)),
  ),

  Task(
    id: "t3",
    userId: "u1",
    title: "Đi chợ nấu ăn",
    image: "imgs/cooking.png",
    createdAt: DateTime.now().subtract(Duration(days: 3)),
  ),

  Task(
    id: "t4",
    userId: "u1",
    title: "Hoàn thành dự án cơ sở",
    image: "imgs/project.png",
    createdAt: DateTime.now().subtract(Duration(days: 4)),
  ),

  // USER 2
  Task(
    id: "t5",
    userId: "u2",
    title: "Tập Gym",
    image: "imgs/gym.png",
    createdAt: DateTime.now().subtract(Duration(days: 1)),
  ),

  Task(
    id: "t6",
    userId: "u2",
    title: "Học Tiếng Anh lấy chứng chỉ",
    image: "imgs/english.png",
    createdAt: DateTime.now().subtract(Duration(days: 2)),
    completed: true,
  ),

  Task(
    id: "t7",
    userId: "u2",
    title: "Đọc sách phát triển bản thân",
    image: "imgs/book.png",
    createdAt: DateTime.now().subtract(Duration(days: 3)),
  ),

  // USER 3
  Task(
    id: "t8",
    userId: "u3",
    title: "Meeting online",
    image: "imgs/meeting.png",
    createdAt: DateTime.now().subtract(Duration(days: 1)),
  ),

  Task(
    id: "t9",
    userId: "u3",
    title: "Design UI/UX",
    image: "imgs/design.png",
    createdAt: DateTime.now().subtract(Duration(days: 2)),
  ),

  Task(
    id: "t10",
    userId: "u3",
    title: "Fix bugs",
    image: "imgs/bug.png",
    createdAt: DateTime.now().subtract(Duration(days: 3)),
    completed: true,
  ),

  Task(
    id: "t11",
    userId: "u3",
    title: "Triển khai ứng dụng",
    image: "imgs/deploy.png",
    createdAt: DateTime.now().subtract(Duration(days: 4)),
  ),
];
