import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utitl/Todo_design.dart';
import '../utitl/listfile.dart';



class Tablayout extends StatefulWidget {
  const Tablayout({super.key});

  @override
  State<Tablayout> createState() => _TablayoutState();
}

class _TablayoutState extends State<Tablayout> {

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
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Welcome to Tablet App")),
      ),
      backgroundColor: Colors.deepPurple,
      floatingActionButton:FloatingActionButton(
          backgroundColor: Colors.grey,
          child: Icon(Icons.add),
          onPressed:()=> showAddDialog(context)),
      body: Center(
        child: Container(
          width: 700,
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
                      updateItem(index);
                    });
                  },
                );
              },
            )),
      ),

    );

  }
}
