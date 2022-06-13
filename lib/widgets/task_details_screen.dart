import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_list/main.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.id});
  final String id;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => print('Edit'),
              icon: const FaIcon(FontAwesomeIcons.penToSquare))
        ],
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          color: Colors.white,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyApp()),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 21, 87, 101),
        title: const Text('Details'),
      ),
      body: TaskDetails(
        id: widget.id,
      ),
    );
  }
}

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

    return FutureBuilder<DocumentSnapshot>(
      future: tasks.doc(id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Container(
            // constraints: const BoxConstraints.tightFor(height: 500),
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    color: (data['completed'])
                        ? const Color.fromARGB(255, 69, 70, 70)
                        : const Color.fromARGB(255, 21, 87, 101),
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                            child: Text(
                              data['name'].toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: (data['completed'])
                                      ? FontStyle.italic
                                      : null,
                                  decoration: (data['completed'])
                                      ? TextDecoration.lineThrough
                                      : null),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 239, 239, 239),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(2.0, 2.0),
                      )
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: const FaIcon(
                                  FontAwesomeIcons.triangleExclamation,
                                  color: Colors.black87,
                                  size: 22,
                                ),
                              ),
                              Text(
                                data['priority'].toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('COMPLETED: ',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 18)),
                              Container(
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                margin: const EdgeInsets.fromLTRB(10, 0, 15, 0),
                                child: Icon(
                                  (data['completed']
                                      ? FontAwesomeIcons.check
                                      : FontAwesomeIcons.x),
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                'DESCRIPTION:',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Text(data['description'].toString().toUpperCase(),
                                style: const TextStyle(fontSize: 18))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const Text("loading");
      },
    );
  }
}
