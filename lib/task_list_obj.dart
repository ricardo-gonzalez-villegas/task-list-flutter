import 'dart:collection';
import 'task_obj.dart';

class TaskList {
  LinkedHashMap map = LinkedHashMap<String, Task>();

  void addTask(Task task) {
    map[task.uuid] = task;
  }

  void removeTask(Task task) {
    map.remove(task.uuid);
  }

  int size() {
    return map.length;
  }

  Task getTask(String key) {
    return map[key];
  }

  void printTasks() {
    map.forEach((uuid, task) {
      print('Key: $uuid, Task: $task');
    });
  }

  Task getTaskFromIndex(int index) {
    List keys = map.keys.toList();
    return map[keys[index]];
  }
}
