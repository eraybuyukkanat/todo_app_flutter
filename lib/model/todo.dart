import 'package:flutter/cupertino.dart';

class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: "01",todoText: "Sabah yürüyüşü",isDone: true),
      ToDo(id: "23",todoText: "Sabah yürüyüşü",isDone: true),
      ToDo(id: "03",todoText: "Sabah yürüyüşü",isDone: true),
      ToDo(id: "04",todoText: "Sabah yürüyüşü",isDone: true),

    ];
  }

}