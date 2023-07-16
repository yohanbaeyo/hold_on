import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: ((context) {
              return AlertDialog(
                title: Text("TextField in Dialog"),
                content: TextField(
                  onChanged: (value) {

                  },
                ),
              )
            })
          },
          backgroundColor: tdBlue,
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(children: [
            searchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                    child: Text('All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500)),
                  ),
                  for (ToDo it in todoList) ToDoItem(todo: it)
                ],
              ),
            )
          ]),
        ));
  }

  Container searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            suffixIcon: Icon(Icons.search, color: tdBlack, size: 20),
            suffixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: tdGrey)),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: tdBlack, size: 30),
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color.fromARGB(255, 218, 218, 218),
                  //     blurRadius: 8.0,
                  //     spreadRadius: 3.0
                  //   )
                  // ]
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('assets/images/user.png'))),
          ],
        ));
  }

  void _handleToDoChange(ToDo todo) {
    todo.isDone = !todo.isDone;
  }

  Future<void> _displayToDoInputDialog(BuildContext context) async {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Add ToDo Item'),
        content: TextField(
          onChanged: (value) {
            setState()
          },
        ),
      )
    });
  }
}
