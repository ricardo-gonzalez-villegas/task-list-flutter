import 'package:flutter/widgets.dart';
import 'task_view.dart';
import '/task_obj.dart';
import '/task_list_obj.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key, required this.taskList});
  final TaskList taskList;

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.taskList.size(),
      itemBuilder: (BuildContext context, int index) {
        Task task = widget.taskList.getTaskFromIndex(index);
        return TaskView(
          task: task,
        );
      },
    );
  }
}
