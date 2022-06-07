import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:task_list/main.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
            color: Colors.white,
            onPressed: () => print('I was clicked'),
          ),
          backgroundColor: const Color.fromARGB(255, 21, 87, 101),
          title: const Text('Create Task'),
        ),
        body: const Center(
          child: Text('Create Task Screen'),
        ),
      ),
    );
  }
}
