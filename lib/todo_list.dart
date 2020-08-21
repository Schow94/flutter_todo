import 'package:flutter/material.dart';

import './todo.dart';
import './models/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> todoItems;
  final Function removeTodo;

  TodoList(this.todoItems, this.removeTodo);

  @override
  Widget build(BuildContext context) {
    // Convert to Listview Tomorrow
    return Container(
      width: 370,
      child: Container(
        width: double.infinity,
        // color: Colors.blue,
        child: Column(
          children: todoItems
              .map(
                (task) => Todo(task, removeTodo),
              )
              .toList(),
        ),
      ),
    );
  }
}
