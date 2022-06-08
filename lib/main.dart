import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_list/widgets/create_task_screen.dart';
import 'package:flutter/material.dart';
import 'widgets/task_list_screen.dart';
import 'task_list_obj.dart';
import 'task_obj.dart';

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
    return const MaterialApp(title: 'Task List', home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateTaskScreen(),
                    ),
                  ),
              icon: const FaIcon(FontAwesomeIcons.squarePlus))
        ],
        backgroundColor: const Color.fromARGB(255, 21, 87, 101),
        title: const Text('Task List'),
      ),
      body: Center(
        child: TaskListScreen(
          taskList: list,
        ),
      ),
    );
  }
}
