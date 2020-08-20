import 'package:flutter/material.dart';

class AddTodoInput extends StatelessWidget {
  final todoController = TextEditingController();
  final Function addNewTodo;

  AddTodoInput(this.addNewTodo);

  void submitData() {
    final newTodo = todoController.text;

    addNewTodo(newTodo);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            controller: todoController,
            decoration: InputDecoration(
              labelText: 'Todo Item',
            ),
            onSubmitted: (_) => submitData(),
          ),
          RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Add new Todo',
                style: TextStyle(
                  color: Colors.white,
                )),
            onPressed: submitData,
          ),
        ],
      ),
    );
  }
}
