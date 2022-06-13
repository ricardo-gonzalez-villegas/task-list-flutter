import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'task_item.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> tasks =
      FirebaseFirestore.instance.collection('tasks').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: tasks,
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot,
      ) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }

        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.size,
          itemBuilder: ((context, index) {
            return TaskItem(
              id: data.docs[index].reference.id,
              name: data.docs[index]['name'],
              description: data.docs[index]['description'],
              priority: data.docs[index]['priority'],
              completed: data.docs[index]['completed'],
            );
          }),
        );
      },
    );
  }
}
