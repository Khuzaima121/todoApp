import 'package:flutter/material.dart';
import 'package:todoooappppppp/listItem.dart';
import 'package:todoooappppppp/utitl/Todo_design.dart';
import 'package:todoooappppppp/utitl/dialogbox.dart';

import '../utitl/listfile.dart';

class Mobilelayout extends StatefulWidget {
  Mobilelayout({super.key});

  @override
  State<Mobilelayout> createState() => _MobilelayoutState();
}

class _MobilelayoutState extends State<Mobilelayout> {

/*
  TextEditingController tdtitile=TextEditingController();
  TextEditingController tddesc=TextEditingController();
  final titleController=TextEditingController();
  final descController=TextEditingController();
  static List todolist = [
    ["My first", "First Description", false],
    ["Second first", "Second Description", true]
  ];

  void onAdd()
  {
    setState(() {
      todolist.add([titleController.text,descController.text,false]);
      titleController.clear();
      descController.clear();

    });
    Navigator.of(context).pop();
  }
  void CheckBoxChanged(bool?value,int index) {
    setState(() {
      todolist[index][2] = !todolist[index][2];
    });


  }
  void deleteFunction(int index)
  {
    setState(() {
      todolist.removeAt(index);
    });
  }
  void showAddDialog()
  {
    showDialog(context: context, builder: (context) {
      return dialogbox(titlecontroller:titleController ,desccontroller:  descController,onAdd: onAdd,onCancel:()=>Navigator.of(context).pop());
    },);
  }
*/
  void addItem() {

   setState(() {
     db.todolist.add([titleController.text, descController.text, false]);
     titleController.clear();
     descController.clear();
   });
   db.Updatedatabse();
  }
  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add a task"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                keyboardType: TextInputType.text,
                maxLength: 15,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter the title of the task",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter details",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {

                addItem();
                Navigator.of(context).pop();
              },
              child: const Text("Add task", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Mobile App"),
        ),
        floatingActionButton:FloatingActionButton(
            backgroundColor: Colors.grey,
            child: Icon(Icons.add),
            onPressed:() =>showAddDialog(context)),
        backgroundColor: Colors.green,
        body: Container(
          padding: EdgeInsets.only(top: 20,left: 5,right: 5),
            child:ListView.builder(
              itemCount: db.todolist.length,
              itemBuilder: (context, index) {
                return TodoDesign(
                  todoname: db.todolist[index][0],
                  details: db.todolist[index][1],
                  istodochecked: db.todolist[index][2],
                  onChange: (value) {
                    setState(() {
                      toggleCheckbox(index);
                    });
                  },
                  deletefunction:(context){
                    setState(() {
                      deleteItem(index);
                    });
                  },
                  updatefunction: (context){
                    setState(() {
                 showUpdateDialog(context, index);
                    });
                  },
                );
              },
            ))
    );
  }
/*void onUpdate(int index)
{
   setState(() {
     todolist[index][0]=titleController.text;
     todolist[index][1]=descController.text;
     todolist[index][2]=false;
   });
   Navigator.of(context).pop();
}

  upfatefunction(int index) {
    TextEditingController tdtitile=TextEditingController();
    TextEditingController tddesc=TextEditingController();
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Add a task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: tdtitile,
              keyboardType: TextInputType.text,
              maxLength: 15,
              decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
              ),
                hintText: "Enter the title of the task",
            ),
            ),
            SizedBox(height: 10),
            TextField(
             controller: tddesc,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Enter details",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),),
          ],

        ),
        actions: [
          TextButton(onPressed: ()=>onUpdate( index), child: const Text("Update task",style: TextStyle(

              fontSize: 20,
              color: Colors.black,
              fontWeight:FontWeight.bold
          ))),
          TextButton(onPressed:()=> Navigator.of(context).pop(), child: const Text("cancel",style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight:FontWeight.bold
          ),))
        ],
      );
    },);
  }*/
}
