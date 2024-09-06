import 'package:flutter/material.dart';
import 'package:todoooappppppp/data/databse.dart';

TextEditingController tdtitile = TextEditingController();
TextEditingController tddesc = TextEditingController();
final titleController = TextEditingController();
final descController = TextEditingController();

TodoDatabase db=new TodoDatabase();


void toggleCheckbox(int index) {
  db.todolist[index][2] = !db.todolist[index][2];
  db.Updatedatabse();
}

void deleteItem(int index) {
  db.todolist.removeAt(index);
  db.Updatedatabse();
}



void showUpdateDialog(BuildContext context, int index,Function updateitem) {
  tdtitile.text = db.todolist[index][0];
  tddesc.text = db.todolist[index][1];

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Update a task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: tdtitile,
              keyboardType: TextInputType.text,
              maxLength: 15,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter the title of the task",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: tddesc,
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
              updateitem(index);
              Navigator.of(context).pop();
            },
            child: const Text("Update task", style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
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
