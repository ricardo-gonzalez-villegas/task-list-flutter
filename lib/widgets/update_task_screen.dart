import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task_list/widgets/task_details_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_list/main.dart';

class UpdateTaskScreen extends StatelessWidget {
  UpdateTaskScreen({super.key, required this.id});
  final String id;
  final GlobalKey<FormState> formKeyUpdate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => formKeyUpdate.currentState!.reset(),
              icon: const FaIcon(FontAwesomeIcons.arrowRotateLeft))
        ],
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          color: Colors.white,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskDetailsScreen(id: id)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 21, 87, 101),
        title: const Text('Edit Task'),
      ),
      body: TaskForm(formKey: formKeyUpdate, id: id),
    );
  }
}

class TaskForm extends StatefulWidget {
  const TaskForm({super.key, required this.formKey, required this.id});
  final String id;
  final GlobalKey<FormState> formKey;

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  String _name = '';
  bool _nameIsMaxLength = false;
  bool _descriptionIsMaxLength = false;
  String _description = '';
  String _priority = '';
  Map<String, dynamic> data = <String, dynamic>{};
  @override
  Widget build(BuildContext context) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
    DocumentReference task = tasks.doc(widget.id);

    return FutureBuilder<DocumentSnapshot>(
      future: tasks.doc(widget.id).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          data = snapshot.data!.data() as Map<String, dynamic>;
        }
        if (data.isNotEmpty) {
          return Form(
            key: widget.formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        initialValue: data['name'],
                        maxLength: 30,
                        onChanged: (value) {
                          _name = value;
                          setState(() {
                            _nameIsMaxLength =
                                (value.length == 30) ? true : false;
                          });
                        },
                        decoration: InputDecoration(
                          helperStyle: (_nameIsMaxLength)
                              ? const TextStyle(color: Colors.red)
                              : null,
                          fillColor: const Color.fromARGB(255, 215, 225, 231),
                          filled: true,
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter text.';
                          }
                          return null;
                        }),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(fontSize: 16),
                      ),
                      TextFormField(
                        initialValue: data['description'],
                        maxLength: 200,
                        maxLines: 5,
                        onChanged: (value) {
                          _description = value;
                          setState(() {
                            _descriptionIsMaxLength =
                                (value.length == 200) ? true : false;
                          });
                        },
                        decoration: InputDecoration(
                          helperStyle: (_descriptionIsMaxLength)
                              ? const TextStyle(color: Colors.red)
                              : null,
                          fillColor: const Color.fromARGB(255, 215, 225, 231),
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Priority Level',
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButtonFormField(
                        value: data['priority'].toString(),
                        decoration: const InputDecoration(
                          fillColor: Color.fromARGB(255, 215, 225, 231),
                          filled: true,
                        ),
                        items: <String>['Low', 'Med', 'High']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          _priority = newValue!;
                        },
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 21, 87, 101),
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                    ),
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        task.update({
                          'name': (_name == '') ? data['name'] : _name,
                          'description': (_description == '')
                              ? data['description']
                              : _description,
                          'priority':
                              (_priority == '') ? data['priority'] : _priority,
                        });

                        widget.formKey.currentState!.reset();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()),
                        );
                      }
                    },
                    child: const Text('Update'))
              ],
            ),
          );
        }
        return const Text('Loading');
      },
    );
  }
}
