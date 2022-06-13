import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './task_details_screen.dart';

// ignore: must_be_immutable
class TaskItem extends StatefulWidget {
  TaskItem({
    super.key,
    required this.id,
    required this.name,
    required this.description,
    required this.priority,
    required this.completed,
  });

  final String id;
  final String name;
  final String description;
  final String priority;
  bool completed;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  void toggleCompleted() {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('tasks').doc(widget.id);
    setState(() {
      docRef.update({'completed': !widget.completed});
      widget.completed = !widget.completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
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
              color: (!widget.completed)
                  ? const Color.fromARGB(255, 21, 87, 101)
                  : const Color.fromARGB(255, 69, 70, 70),
            ),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 0, 10, 0),
                      child: Text(
                        widget.name.toString().toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontStyle:
                                (widget.completed) ? FontStyle.italic : null,
                            decoration: (widget.completed)
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
                      onPressed: () => toggleCompleted(),
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
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TaskDetailsScreen(id: widget.id),
                        ),
                      ),
                      icon: const FaIcon(FontAwesomeIcons.caretDown),
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
