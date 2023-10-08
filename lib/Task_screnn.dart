
import 'package:flutter/cupertino.dart';

class Task_screnn extends StatefulWidget {
  const Task_screnn({Key? key}) : super(key: key);

  @override
  State<Task_screnn> createState() => _Task_scrennState();
}

class _Task_scrennState extends State<Task_screnn> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Tasks",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),));
  }
}