import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'task_item.dart';

class TaskListScreen extends StatelessWidget {
  TaskListScreen({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> tasks =
      FirebaseFirestore.instance.collection('tasks').snapshots();
  final CollectionReference colRef =
      FirebaseFirestore.instance.collection('tasks');
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
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                colRef.doc(data.docs[index].reference.id).delete();
              },
              background: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 169, 45, 36),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(2.0, 2.0),
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Deleted',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              child: TaskItem(
                id: data.docs[index].reference.id,
                name: data.docs[index]['name'],
                description: data.docs[index]['description'],
                priority: data.docs[index]['priority'],
                completed: data.docs[index]['completed'],
              ),
            );
          }),
        );
      },
    );
  }
}
