


import 'package:flutter/material.dart';
import 'package:todo_app/screens/large_screen/mainLargeScreen.dart';
import 'package:todo_app/screens/small_screen/mainSmallScreen.dart';

void main(){
  runApp(MaterialApp(home: MainScreen()));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        MediaQuery.of(context).size.width>500
        ?MainLargeScreen()
        :MainSmallScreen();

  }
}

