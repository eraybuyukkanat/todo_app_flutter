import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem({Key? key,required this.todo,required this.onToDoChanged,this.onDeleteItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
      onTap: (){
        onToDoChanged(todo);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.black45,
      leading: Icon(todo.isDone?Icons.check_box:Icons.check_box_outline_blank,color: Colors.white,),
      title: Text(todo.todoText!,style: TextStyle(fontSize: 20,color: Colors.white,
          decoration: todo.isDone?TextDecoration.lineThrough:null),
      ),
      trailing: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: IconButton(
          color: Colors.white,
          iconSize: 18,
          icon: Icon(Icons.delete),
          onPressed: (){onDeleteItem(todo.id);},
        ),
      ),
    ),);
  }
}
