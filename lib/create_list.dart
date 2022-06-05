// ignore_for_file: file_names
import 'task_list_obj.dart';
import 'task_obj.dart';

Task one = Task('one', 'description', 'low');
Task two = Task('two', 'description', 'low');
Task three = Task('three', 'description', 'low');
Task four = Task('four', 'description', 'med');
Task five = Task('five', 'description', 'med');
Task six = Task('six', 'description', 'med');
Task seven = Task('seven', 'description', 'high');
Task eight = Task('eight', 'description', 'high');
Task nine = Task('nine', 'description', 'high');

TaskList list = TaskList();

void main() {
  list.addTask(one);
  list.addTask(two);
  list.addTask(three);
  list.addTask(four);
  list.addTask(five);
  list.addTask(six);
  list.addTask(seven);
  list.addTask(eight);
  list.addTask(nine);
  list.removeTask(four);
  list.printTasks;
}
