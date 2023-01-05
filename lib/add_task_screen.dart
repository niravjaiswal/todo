import 'package:flutter/material.dart';
import 'package:my_app/task.dart';
import 'package:my_app/textbox.dart';

class AddTaskScreen extends StatefulWidget {
  final List<Task> tasks;
  final Function() notifyParent;

  AddTaskScreen(this.tasks, this.notifyParent);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController? texthandler = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Textbox(texthandler),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.tasks.add(Task(task: texthandler.text));
                    widget.notifyParent();
                  });
                  print(widget.tasks);
                  setState(() {
                    Navigator.pop(context);
                  });
                },
                child: const Text("Add Task"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
