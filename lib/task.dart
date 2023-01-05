class Task {
  late final String task;
  late bool progress;

  Task({required this.task, this.progress = false});

  String getTask() => task;
  void setTask(task) => this.task = task;
  bool getProgress() => progress;
  void setProgress(progress) => this.progress = progress;
}
