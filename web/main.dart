import 'dart:html';
import 'class/Todo.dart';
import 'components/addTodo.dart';
import 'components/removeTodo.dart';
import 'components/sort.dart';
import 'components/storage.dart';
import 'components/updateTodo.dart';

// Declaration of the variables
late InputElement todoInput;
late SelectElement priority;
late SelectElement sort;
late InputElement date;
late DivElement uiList;
late DivElement uiCompleteList;
late ButtonElement addButton;
late TableElement table;
late FormElement form;
late DivElement emptyList;
late ButtonElement clear;

List<Todo?> todoList = [];
List<Todo?> comList = [];

Future<void> main() async {
  // Initialization of the variables
  todoInput = querySelector('#todoInput') as InputElement;
  date = querySelector('#datepicker') as InputElement;
  priority = querySelector('#priority') as SelectElement;
  sort = querySelector('#sort') as SelectElement;
  uiList = querySelector('#todo-list') as DivElement;
  uiCompleteList = querySelector('#todo-complete') as DivElement;
  addButton = querySelector('#addBtn') as ButtonElement;
  emptyList = querySelector('#empty-list') as DivElement;
  clear = querySelector('#clear') as ButtonElement;
  await getStorage();
  await getCompleteStorage();
  addButton.onClick.listen(addTodo);
  clear.onClick.listen(removeAllTodos);
  sort.onChange.listen((event) async {
    sortList(sort.value.toString(), todoList);
    updateTodos();
  });

  await todoInput.onKeyUp.contains('Enter') ? addTodo : null;
}
