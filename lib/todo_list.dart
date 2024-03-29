import 'package:flutter/material.dart';
import 'package:my_app/task.dart';

class TodoList extends StatefulWidget {
  final List<Task> tasks;
  final Function whenChecked;
  final Function update;

  TodoList(this.tasks, this.whenChecked, this.update);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Widget> get taskList {
    List<Widget> list = [];
    for (Task taski in widget.tasks) {
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 24.0,
                width: 24.0,
                child: Checkbox(
                    value: taski.progress,
                    onChanged: (value) {
                      setState(() {
                        taski.setProgress(value);
                        widget.whenChecked();
                        widget.update();
                      });
                    })),
            const SizedBox(width: 10.0),
            Text(
              taski.task,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    if (taskList.isEmpty) {
      return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 56, 56, 56),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: const Text(
          "No Tasks",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 56, 56, 56),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: taskList,
        ));
  }
}
