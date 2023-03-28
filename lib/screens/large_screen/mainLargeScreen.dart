import 'dart:developer';
import 'package:flutter/material.dart';
import '../../data/data_repository.dart';
import '../../models/task.dart';
import '../all_tasks.dart';
import '../complete_tasks.dart';
import '../incomplete_tasks.dart';
import '../new_task_screen .dart';

class MainLargeScreen extends StatefulWidget {
  @override
  State<MainLargeScreen> createState() => _MainLargeScreenState();
}

class _MainLargeScreenState extends State<MainLargeScreen> {
  List<String> titles = ["All Tasks", "Complete Tasks", "InComplete Tasks"];
  int currentPageIndex = 0;
  PageController pc = PageController();
  refreshMainScreen(){
    print("hello");   
    log('hello world');
    setState(() {});
  }
  removeTask(Task task) {
    DataRepo.tasks.remove(task);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[currentPageIndex]),),
      body:Row(
        children:[
          Expanded(child:
        SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(accountName: Text("Esraa Tabash"),
                  accountEmail: Text("EsraaTabash@gmail.com"),
                  currentAccountPicture:CircleAvatar(backgroundColor: Colors.white))
              ,ListTile(
                title: Text("All Tasks"),
                subtitle: Text("go to all tasks"),
                leading: Icon(Icons.menu),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  pc.jumpToPage(0);
                  Navigator.of(context).pop();
                  setState(() {});
                },
              ),ListTile(
                title: Text("Complete Tasks"),
                subtitle: Text("go to complete tasks"),
                leading: Icon(Icons.done),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  pc.jumpToPage(1);
                  Navigator.of(context).pop();
                  setState(() {});
                },
              ),ListTile(
                title: Text("Incomplete Tasks"),
                subtitle: Text("go to incomplete tasks"),
                leading: Icon(Icons.cancel),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  pc.jumpToPage(2);
                  Navigator.of(context).pop();
                  setState(() {});
                },
              ),
            ],
          ),
        )),
          Expanded(
            child: PageView(
            controller: pc,
            onPageChanged: (v){
              currentPageIndex =  v;
              setState(() {
              });
            },
            children: [
              AllTasks(refreshMainScreen,removeTask),
              CompleteTasks(refreshMainScreen,removeTask),
              InCompleteTasks(refreshMainScreen,removeTask),
            ],
        ),
          ),

        ]
      )
      ,bottomNavigationBar: BottomNavigationBar(
      currentIndex: currentPageIndex,
      onTap: (value){
        currentPageIndex = value;
        pc.jumpToPage(value);
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.list),label: "AllTasks"),
        BottomNavigationBarItem(icon: Icon(Icons.done),label: "CompleteTasks"),
        BottomNavigationBarItem(icon: Icon(Icons.cancel),label: "IncompleteTasks"),
      ],
    )
      ,floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return NewTaskScreen(refreshMainScreen);
          }));
        }),
    );
  }
}
