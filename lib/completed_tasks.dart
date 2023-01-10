import 'package:flutter/material.dart';
import 'package:my_app/task.dart';

class CompletedTasks extends StatefulWidget {
  final List<Task> tasks;
  final Function whenChecked;
  final Function update;

  CompletedTasks(this.tasks, this.whenChecked, this.update);

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  List<Widget> get completedList {
    List<Widget> list = [];
    for (Task taski in (widget.tasks).reversed) {
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
    if (completedList.isEmpty) {
      return const SizedBox(
        height: 15,
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
          children: completedList,
        ));
  }
}
