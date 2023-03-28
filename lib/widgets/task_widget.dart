import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  TaskWidget(this.task,this.function,this.functionRemove);
  Function function;
  Function functionRemove;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(
        value: widget.task.isComplete,
        onChanged: (v) {
          widget.task.isComplete = !widget.task.isComplete;
          setState(() {});
          widget.function();
        },
      ),
      leading: IconButton(
          icon:Icon(Icons.delete),
          onPressed: (){
            widget.functionRemove(widget.task);
          }),
      title: Text(widget.task.name)
    );
  }
}
