import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'task_list_obj.dart';
import 'task_obj.dart';
import './widgets/task.dart';

Task one = Task('task one', 'description', 'low');
Task two = Task('task two', 'description', 'low');
Task three = Task('task three', 'description', 'low');
Task four = Task('task four', 'description', 'med');
Task five = Task('task five', 'description', 'med');
Task six = Task('task six', 'description', 'med');
Task seven = Task('task seven', 'description', 'high');
Task eight = Task('task eight', 'description', 'high');
Task nine = Task('task nine', 'description', 'high');
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
          actions: [
            IconButton(
                onPressed: () => print('I was pressed'),
                icon: const FaIcon(FontAwesomeIcons.squarePlus))
          ],
          backgroundColor: const Color.fromARGB(255, 21, 87, 101),
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
        return TaskView(
          name: task.getName,
          description: task.getDescription,
          priority: task.getPriority,
          completed: task.getCompleted,
          toggleCompleted: task.toggleCompleted,
        );
      },
    );
  }
}
