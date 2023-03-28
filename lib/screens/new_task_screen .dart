
import 'package:flutter/material.dart';
import 'package:todo_app/data/data_repository.dart';
import 'package:todo_app/models/task.dart';

class NewTaskScreen  extends StatelessWidget {
  Function function;
  NewTaskScreen(this.function);
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("New Task Screen"),),
      body: Column(
        children: [
          TextField(controller: controller,),
          ElevatedButton(onPressed: (){
            DataRepo.tasks.add(Task(controller.text));
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title:Text("New Task has been added, press on ok to return to main page"),
                actions: [
                  TextButton(onPressed: (){
                    function();
                    Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  }, child: Text("ok")),

                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("add another task"))
                ],
              );
            });
          }, child: Text("Add New Task"),)
        ],
      ),
    );
  }
}
