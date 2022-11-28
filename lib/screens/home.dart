
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/widgets/todo_item.dart';
import 'package:todoapp/model/todo.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [

                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20,bottom:20,),
                        child: Text("Tümü",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                      ),
                      for(ToDo todo in todosList)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),


                    ],
                  ),
                )
              ]
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    )],
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Yeni bir yapılacak giriniz',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  child: ElevatedButton(
                    child: Text('+',style: TextStyle(fontSize: 40,),),
                    onPressed: (){
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      minimumSize: Size(60,60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id){
    setState(() {
      todosList.removeWhere((item) => item.id==id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo));
    });
    _todoController.clear();
  }

  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search,color: Colors.white,size: 20,),
          prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
          border: InputBorder.none,
          hintText: 'Ara',
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Yapılacaklar Listesi",style: TextStyle(color: Colors.black,fontSize: 22,),),
        ]),

      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: (){},
        color: Colors.black,
        iconSize: 30,
      ),
    );
  }
}


