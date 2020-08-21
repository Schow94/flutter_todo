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
      finished: true,
    ),
    TodoItem(
      id: DateTime.now().toString(),
      title: 'Workout',
      date: DateTime.now(),
      finished: false,
    ),
  ];

  void _addNewTodo(String todoTitle) {
    final newTodo = TodoItem(
      id: DateTime.now().toString(),
      title: todoTitle,
      date: DateTime.now(),
      finished: false,
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

  void _toggleAddTodo(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: AddTodoInput(_addNewTodo),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

// Not sure how to find object of interest, update it, and then update list of objects
  void _toggleFinihed(String id) {
    setState(() {
      Object itemToEdit = _todoItems.where((task) => task.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _toggleAddTodo(context),
            ),
          ],
        ),
        body: Container(
          color: Colors.grey[200],
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  'Todo List',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              TodoList(_todoItems, _removeTodo),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _toggleAddTodo(context),
        ),
      ),
    );
  }
}
