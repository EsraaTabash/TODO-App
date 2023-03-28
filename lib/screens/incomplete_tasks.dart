import 'package:flutter/material.dart';
import 'package:todo_app/data/data_repository.dart';
import 'package:todo_app/widgets/task_widget.dart';

class InCompleteTasks   extends StatelessWidget {
  Function function;
  Function functionRemove;
  InCompleteTasks(this.function,this.functionRemove);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: DataRepo.tasks.where((element) => !element.isComplete).toList().length,
      itemBuilder: (context, index){
        return TaskWidget(DataRepo.tasks.where((element) => !element.isComplete).toList()[index],function,functionRemove);
      },
    );  }
}
