import 'package:flutter/material.dart';

class TodoItem {
  final String id;
  final String title;
  final DateTime date;

  TodoItem({
    @required this.id,
    @required this.title,
    @required this.date,
  });
}
