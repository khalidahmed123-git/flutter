import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'Archived_screnn.dart';
import 'Done_screnn.dart';
import 'Task_screnn.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     createdatabase();
  }
  late Database dadabase;

  int curent_index=0;
  List<Widget> scren=[
    Task_screnn(),
    Done_scren(),
    Archived_screnn(),
  ];
  List<Widget> Titels=[
    Text("Tasks"),
    Text("Done"),
    Text("Archived"),
  ];
  List data=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Titels[curent_index],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){





        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        onTap: (index){
          setState(() {
            curent_index=index;
          });

        },
        currentIndex: curent_index,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu),
              label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.check),
              label: "Done"),
          BottomNavigationBarItem(icon: Icon(Icons.archive),
              label: "Arctiv"),
        ],
      ),
      body: scren[curent_index],
    );
  }

  void createdatabase() async{
     dadabase= await openDatabase(
      'data.db',
      version: 1,
      onCreate: (database,version){
        print("database was created");
        database.execute("create table test2(id integer ,title text,date text,time text,status text)").then((value) {
          print("table was created");
        }).catchError((error){
          print("erroewwwww${error.toString()}" );
        });


        
      },
       
      onOpen: (database){
         getdata(database);
         database.execute("alter table test2  id integer PRIMARY KEY;").then((value) {
           print("table was modified");
         }).catchError((error){
           print("erroewwwww${error.toString()}" );
         });


        print("database was opened");
      },
    );
  }
  void insertdatabase(){
    dadabase.transaction((txn) => txn.rawInsert("insert into Test (name,value,num) values('khalid',1,2.0)").then((value) {
        print("$value insert successful");

      }).catchError((error){
        print("error ${error.toString()}");
      }));
    dadabase.transaction((txn) => txn.rawInsert("insert into test2 (title,date,time,status) values('khalid','2020','12pm','new')").then((value) {
      print("$value insert successful");

    }).catchError((error){
      print("error ${error.toString()}");
    }));

  }
void getdata(database) async {
    List<Map> tasks= await database.rawQuery('SELECT * FROM test');
    print(tasks);
    List<Map> tasks2= await database.rawQuery('SELECT * FROM test2');
    print(tasks2);


}

// void createdatabase() async{
//
//   var  database= await openDatabase(
//     'data.db',
//     version: 1,
//     onCreate: (database,version){
//       print("data base created");
//       database.execute("create table test(id integer,title text,date text,time text,status text)").then((value){
//         print("table created");
//       }).catchError((error){
//         print("erroewwwww${error.toString()}" );
//       });
//
//
//
//     },
//     onOpen: (database){
//       print("data base opened");
//     },
//
//   );
//
// }
// void insertdatabase(){
//
//
// }
}


