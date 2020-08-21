import 'package:flutter/material.dart';

import './todo.dart';
import './models/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoItem> todoItems;
  final Function removeTodo;

  TodoList(this.todoItems, this.removeTodo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
