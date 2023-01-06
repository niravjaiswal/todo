import 'package:flutter/material.dart';
import 'package:my_app/completed_tasks.dart';
import 'package:my_app/todo_list.dart';
import 'package:my_app/task.dart';
import 'package:my_app/add_task_button.dart';
import 'package:my_app/add_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Task> tasks = [];
  List<Task> completed = [];

  void _setCompleted() {
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].progress == true) {
        completed.add(tasks[i]);
        tasks.removeAt(i);
      }
    }
    if (completed.length >= 7) {
      completed.removeAt(0);
    }
    for (int i = 0; i < completed.length; i++) {
      if (completed[i].progress == false) {
        tasks.add(completed[i]);
        completed.removeAt(i);
      }
    }
    print(completed);
  }

  refresh() {
    setState(() {
      _setCompleted;
      tasks = tasks;
      completed = completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo List",
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 21, 21, 21),
          unselectedWidgetColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ToDo List"),
        ),
        body: Column(
          children: [
            TodoList(tasks, _setCompleted, refresh),
            const SizedBox(height: 15),
            CompletedTasks(completed, _setCompleted, refresh)
          ],
        ),
        floatingActionButton: AddTaskButton(tasks, refresh),
      ),
    );
  }
}
