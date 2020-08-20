import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
              .map((task) => Container(
                    width: double.infinity,
                    height: 100,
                    child: Card(
                        color: Colors.grey[300],
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                task.title,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(DateFormat.yMMMd().format(task.date)),
                              Container(
                                // color: Colors.green,
                                width: 180,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                        )),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
