import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '/task_obj.dart';

class TaskView extends StatefulWidget {
  const TaskView({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  void _handleClick() {
    setState(() {
      widget.task.toggleCompleted();
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
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
              color: (widget.task.getCompleted)
                  ? const Color.fromARGB(255, 21, 87, 101)
                  : const Color.fromARGB(255, 102, 171, 140),
            ),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Text(
                        widget.task.getName.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle: (widget.task.getCompleted)
                                ? FontStyle.italic
                                : null,
                            decoration: (widget.task.getCompleted)
                                ? TextDecoration.lineThrough
                                : null),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      onPressed: () => _handleClick(),
                      icon: (widget.task.getCompleted)
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
                        widget.task.getPriority.toUpperCase(),
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
