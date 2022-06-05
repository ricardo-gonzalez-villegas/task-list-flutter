// ignore_for_file: file_names
import 'package:uuid/uuid.dart';

class Task {
  String uuid = const Uuid().v4();
  String name;
  String description;
  String priority;
  bool completed = false;

  set setName(String name) {
    this.name = name;
  }

  set setDescription(String description) {
    this.description = description;
  }

  set setPriority(String priority) {
    this.priority = priority;
  }

  set setCompleted(bool completed) {
    this.completed = completed;
  }

  String get getUuid {
    return uuid;
  }

  String get getName {
    return name;
  }

  String get getDescription {
    return description;
  }

  String get getPriority {
    return priority;
  }

  bool get getCompleted {
    return completed;
  }

  Task(this.name, this.description, this.priority);

  @override
  String toString() {
    return 'ID: $uuid, Task: $name, Description: $description, Priority: $priority, Completed: $completed';
  }
}
