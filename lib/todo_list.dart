import 'dart:ui';

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
      /*list.add(CheckboxListTile(
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
      ));*/
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
                      setState(() => taski.setProgress(value));
                    })),
            // You can play with the width to adjust your
            // desired spacing
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
    return Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: taskList,
        ));
  }
}
