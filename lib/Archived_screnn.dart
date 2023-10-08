
import 'package:flutter/cupertino.dart';

class Archived_screnn extends StatefulWidget {
  const Archived_screnn({Key? key}) : super(key: key);

  @override
  State<Archived_screnn> createState() => _Archived_scrennState();
}

class _Archived_scrennState extends State<Archived_screnn> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Archived",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),));
  }
}
