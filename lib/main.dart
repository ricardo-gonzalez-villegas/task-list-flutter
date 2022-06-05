import 'package:flutter/material.dart';
import 'task_list_obj.dart';
import 'task_obj.dart';
import './widgets/task.dart';

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
void main(List<String> args) {
  list.addTask(one);
  list.addTask(two);
  list.addTask(three);
  list.addTask(four);
  list.addTask(five);
  list.addTask(six);
  list.addTask(seven);
  list.addTask(eight);
  list.addTask(nine);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Task List'),
        ),
        body: const Center(
          child: TaskListView(),
        ),
      ),
    );
  }
}

class TaskListView extends StatefulWidget {
  const TaskListView({Key? key}) : super(key: key);

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.size(),
      itemBuilder: (BuildContext context, int index) {
        Task task = list.getTaskFromIndex(index);
        return Container(
          padding: const EdgeInsets.all(16),
          child: TaskView(
            name: task.getName,
            description: task.getDescription,
            priority: task.getPriority,
          ),
        );
      },
    );
  }
}
