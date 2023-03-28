import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/data_repository.dart';
import 'package:todo_app/widgets/task_widget.dart';

class AllTasks  extends StatelessWidget {
  Function function;
  Function functionRemove;
  AllTasks(this.function,this.functionRemove);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DataRepo.tasks.length,
      itemBuilder: (context, index){
        return TaskWidget(DataRepo.tasks[index],function,functionRemove);
      },
    );
  }
}
