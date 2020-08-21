import 'package:flutter/material.dart';

class TodoItem {
  final String id;
  final String title;
  final DateTime date;
  final bool finished;

  TodoItem({
    @required this.id,
    @required this.title,
    @required this.date,
    @required this.finished,
  });
}
