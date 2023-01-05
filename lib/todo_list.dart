import 'package:flutter/material.dart';
import 'package:my_app/task.dart';

class TodoList extends StatefulWidget {
  final List<Task> tasks;

  TodoList(this.tasks);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Widget> get taskList {
    List<Widget> list = [];
    for (Task taski in widget.tasks) {
      list.add(CheckboxListTile(
        selectedTileColor: Colors.amber,
        value: taski.progress,
        onChanged: (boolean) {
          setState(() {
            taski.setProgress(boolean);
          });
        },
        title: Text(
          taski.task,
          style: const TextStyle(color: Colors.white),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: taskList,
    );
  }
}
