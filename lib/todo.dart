import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/todo_item.dart';

class Todo extends StatelessWidget {
  final TodoItem task;
  final Function removeTodo;

  Todo(this.task, this.removeTodo);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 18,
                      decoration: task.finished ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(task.date),
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      color: Colors.green,
                      onPressed: () {},
                      icon: Icon(Icons.check_circle, size: 30),
                    ),
                    IconButton(
                      color: Colors.orange,
                      onPressed: () {},
                      icon: Icon(Icons.edit, size: 30),
                    ),
                    IconButton(
                      color: Colors.red,
                      onPressed: () => removeTodo(task.id),
                      icon: Icon(Icons.delete, size: 30),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
