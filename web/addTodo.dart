import 'dart:html';
import 'Todo.dart';
import 'main.dart';
import 'updateTodo.dart';

void addTodo(Event event) {
  Todo todo =
      Todo(todoInput.value, date.value.toString(), priority.value.toString());
  todoList.add(todo);

  updateTodos();
  todoInput.value = '';

  DateTime fomatter = todo.createdTime;
  String createdFormatted =
      "${fomatter.year.toString()}-${fomatter.month.toString().padLeft(2, '0')}-${fomatter.day.toString().padLeft(2, '0')}";
}
