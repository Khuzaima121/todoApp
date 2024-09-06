import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoooappppppp/pages/MobileLayout.dart';

class dialogbox extends StatelessWidget {

TextEditingController titlecontroller=TextEditingController();
  TextEditingController  desccontroller=TextEditingController();
  VoidCallback onAdd;
  VoidCallback onCancel;
dialogbox({super.key,required this.titlecontroller,required this.desccontroller,required this.onAdd,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      title: Text("Add a task"),

      content:Column(
        mainAxisSize: MainAxisSize.min,

          children: [

            TextField(
            controller:titlecontroller ,
              keyboardType: TextInputType.text,
              maxLength: 15,
              decoration: InputDecoration(
                hintText: "Enter the title of the task",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                )
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: desccontroller,
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
        TextButton(onPressed: onAdd, child: Text("Add task",style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight:FontWeight.bold
        ))),
        TextButton(onPressed: onCancel, child: Text("cancel",style: TextStyle(
          fontSize: 20,
            color: Colors.black,
          fontWeight:FontWeight.bold
        ),))
      ],

    );
  }
}
