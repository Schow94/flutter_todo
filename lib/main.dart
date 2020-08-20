import 'package:flutter/material.dart';

import './todo_list.dart';
import './models/todo_item.dart';
import './add_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TodoItem> _todoItems = [
    TodoItem(
      id: DateTime.now().toString(),
      title: 'Meal Prep',
      date: DateTime.now(),
    ),
    TodoItem(
      id: DateTime.now().toString(),
      title: 'Workout',
      date: DateTime.now(),
    ),
  ];

  void _addNewTodo(String todoTitle) {
    final newTodo = TodoItem(
      id: DateTime.now().toString(),
      title: todoTitle,
      date: DateTime.now(),
    );

    setState(() {
      _todoItems.add(newTodo);
    });
  }

  void _removeTodo(String id) {
    setState(() {
      _todoItems.removeWhere((val) => val.id == id);
    });
  }

  void _editTodo() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.green,
      title: 'First Flutter App',
      home: Scaffold(
        // backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('Todo App'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: () {})
          ],
        ),
        body: Container(
          // color: Colors.blue,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              AddTodoInput(_addNewTodo),
              TodoList(_todoItems, _removeTodo),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
