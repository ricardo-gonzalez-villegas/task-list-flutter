import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    super.key,
    required this.name,
    required this.description,
    required this.priority,
  });

  final String name;
  final String description;
  final String priority;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(name),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                onPressed: () => print("I was pressed"),
                icon: const Icon(Icons.circle),
              ),
            )
          ],
        ),
        Row(
          children: const [Icon(Icons.circle)],
        )
      ],
    );
  }
}
