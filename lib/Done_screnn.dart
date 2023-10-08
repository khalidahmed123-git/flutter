

import 'package:flutter/cupertino.dart';

class Done_scren extends StatefulWidget {
  const Done_scren({Key? key}) : super(key: key);

  @override
  State<Done_scren> createState() => _Done_screnState();
}

class _Done_screnState extends State<Done_scren> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Done",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),));
  }
}
