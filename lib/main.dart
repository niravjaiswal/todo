import 'package:flutter/material.dart';
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
  refresh() {
    setState(() {
      tasks = tasks;
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
        body: (TodoList(tasks)),
        floatingActionButton: AddTaskButton(tasks, refresh),
      ),
    );
  }
}
