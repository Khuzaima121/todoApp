import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class TodoDesign extends StatelessWidget {
  bool istodochecked;
  String todoname;
  String details;
Function(bool?)? onChange;
Function(BuildContext)? deletefunction;
  Function(BuildContext)? updatefunction;
  TodoDesign({super.key,required this.todoname,required this.details,required this.istodochecked,required this.onChange,required this.deletefunction,required this.updatefunction});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.yellow,
        margin: EdgeInsets.all(5),
        child: istodochecked?Slidable(
          startActionPane: ActionPane(
              motion: StretchMotion() ,
              children: [
                SlidableAction(onPressed: updatefunction,
                  icon: Icons.edit,
                  backgroundColor: Colors.grey,
                )

          ]),
          endActionPane: ActionPane(motion: StretchMotion(),
              children:[
                SlidableAction(onPressed:deletefunction,
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                ),
              ]),
          
          child: ListTile(
            leading: Checkbox(value: istodochecked, onChanged:onChange,
                activeColor: Colors.black,
            ),
            title: Text(todoname ,style: TextStyle(decoration: istodochecked?TextDecoration.lineThrough:TextDecoration.none),),
            subtitle: Text(details),
          
          
          
          ),
        )
            : ListTile(
      leading: Checkbox(value: istodochecked, onChanged:onChange,
      activeColor: Colors.black,
    ),
    title: Text(todoname ,style: TextStyle(decoration: istodochecked?TextDecoration.lineThrough:TextDecoration.none),),
    subtitle: Text(details),



    ),


    );
  }
}
