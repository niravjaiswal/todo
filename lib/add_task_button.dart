import 'package:flutter/material.dart';
import 'package:my_app/add_task_screen.dart';
import 'package:my_app/task.dart';

class AddTaskButton extends StatefulWidget {
  final List<Task> tasks;
  final Function() notifyParent;
  AddTaskButton(this.tasks, this.notifyParent);

  @override
  State<AddTaskButton> createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: (() async {
                final value = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddTaskScreen(widget.tasks, widget.notifyParent),
                  ),
                ).then((value) => setState(() {}));
                ;
              }),
              child: const Icon(Icons.add, color: Colors.white),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20), // <-- Splash color
              ),
            )));
  }
}
