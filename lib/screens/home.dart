import 'dart:convert';

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
  String addTodoDialogTextInput = "";
  String todoItemTitle = "";
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: tdBGColor,
        appBar: _buildAppBar(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _displayToDoInputDialog(context);
          },
          backgroundColor: tdBlue,
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(children: [
            searchBox(),
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 20),
              child: Text('All ToDos',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            ),
            Expanded(
              // child: ListView(
              //   children: [
              //     for (ToDo it in todoList)
              //       ToDoItem(
              //         todo: it,
              //         onToDoChanged: _handleToDoChange,
              //         onDeleteItem: () {},
              //       )
              //   ],
              // ),
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  final item = todoList[index];
                  return Dismissible(
                    key: Key(item.id.toString()),
                    child: ToDoItem(
                      todo: item,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: () {},
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        todoList.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("ToDo Item '${item.todoText}' dismissed")));
                    },
                    background: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red),
                    ),
                  );
                },
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
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(int id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  Future<void> _displayToDoInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add New'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  addTodoDialogTextInput = value;
                });
              },
              controller: textEditingController,
              decoration: const InputDecoration(hintText: "Todo Title"),
            ),
            actions: [
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Cancel"),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text("OK"),
                onPressed: () {
                  setState(() {
                    todoList.add(ToDo(
                        id: ToDo.latest_primary_number,
                        todoText: addTodoDialogTextInput));
                    ToDo.latest_primary_number++;
                  });
                  print(todoItemTitle);
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
