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
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 2)),
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.tasks.add(Task(task: texthandler.text));
                    widget.notifyParent();
                  });
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
