import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskView extends StatefulWidget {
  TaskView({
    super.key,
    required this.name,
    required this.description,
    required this.priority,
    required this.completed,
    required this.toggleCompleted,
  });

  final String name;
  final String description;
  final String priority;
  bool completed;
  final VoidCallback toggleCompleted;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  void _handleClick() {
    widget.toggleCompleted();
    setState(() {
      widget.completed = !widget.completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: const BoxDecoration(
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
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              color: Color.fromARGB(255, 102, 171, 140),
            ),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Text(
                        widget.name.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      color: (widget.completed) ? Colors.black87 : Colors.white,
                      onPressed: () => _handleClick(),
                      icon: (widget.completed)
                          ? const FaIcon(FontAwesomeIcons.squareCheck)
                          : const FaIcon(FontAwesomeIcons.square),
                      iconSize: 22,
                    ),
                  ),
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
            ),
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Row(
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
                        widget.priority.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () => print('I was pressed'),
                      icon: const FaIcon(FontAwesomeIcons.penToSquare),
                      color: Colors.black87,
                      iconSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
