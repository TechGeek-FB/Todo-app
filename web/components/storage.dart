import 'dart:convert';
import 'dart:html';
import '../class/Todo.dart';
import '../main.dart';
import 'removeTodo.dart';
import 'updateTodo.dart';

// late Storage storage;
late dynamic arrTodos;
late dynamic arrdone;
late int lastIndex;
late int lastIndexDone;

getStorage() {
  //('\n Getting Local storage...');

  arrTodos = window.localStorage['todos'];
  //(arrTodos);
  if (arrTodos == "" || (arrTodos == null)) {
    window.localStorage['todos'] = todoList.toString();
    arrTodos = window.localStorage['todos'];
  }
  //("getStorage called");
  //(arrTodos);

  final todos = jsonDecode(arrTodos);

  //(todos);

  todos.forEach((element) {
    Todo singleTodo = Todo.fromJson(element);
    todoList.add(singleTodo);
    //(singleTodo.id);
  });

  if (todoList.isEmpty) {
    lastIndex = 0;
  } else {
    lastIndex = todoList.elementAt(todoList.length - 1)!.id;
  }
  //(lastIndex);

  updateTodos();
  //('Finished Getting Local storage...');
  return todoList;
}

// get completed list
getCompleteStorage() {
  //('\n Getting Local storage...');

  arrdone = window.localStorage['completed'];
  //(arrTodos);
  if (arrdone == "" || (arrdone == null)) {
    window.localStorage['completed'] = comList.toString();
    arrdone = window.localStorage['completed'];
  }
  //("getCompletedStorage called");
  //(arrdone);

  final completed = jsonDecode(arrdone);

  //(completed);

  completed.forEach((element) {
    Todo singleTodo = Todo.fromJson(element);
    comList.add(singleTodo);
    //(singleTodo.id);
  });

  if (comList.isEmpty) {
    lastIndexDone = 0;
  } else {
    lastIndexDone = comList.elementAt(comList.length - 1)!.id;
  }
  //(lastIndexDone);

  updateCompleteList();
  //('Finished Getting Local storage...');
  return comList;
}

addStorage(List todolist) {
  //('\n adding to local storage');
  window.localStorage["todos"] = jsonEncode(todolist);
  final done = window.localStorage['todos'];

  //(done);

  //('\n done adding');
}

// add completed storage
addCompleteStorage(List doneList) {
  //('\n adding completed to local storage');
  window.localStorage["completed"] = jsonEncode(doneList);
  final done = window.localStorage['completed'];

  //(done);

  //('\n done adding');
}
