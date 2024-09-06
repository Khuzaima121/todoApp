import 'package:hive/hive.dart';

class TodoDatabase{
  final _mybox=Hive.box("myBox");

  List todolist=[];
  void CreateinititalData()
  {
     todolist = [
      ["My first", "First Description", false],
      ["Second first", "Second Description", true]
    ];
  }
  void loaddata()
  {
  todolist=_mybox.get('Todolist');
  }
  void Updatedatabse()
  {
    _mybox.put('Todolist',todolist) ;
  }


}