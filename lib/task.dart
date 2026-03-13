class Task {
  int? _id;
  String _name;
  bool _completed = false;

  Task(this._name);

  int? getId() => _id;
  setId(int id) => _id = id;

  String getName() => _name;
  setName(String name) => _name = name;

  bool isCompleted() => _completed;
  setCompleted(bool completed) => _completed = completed;
}
