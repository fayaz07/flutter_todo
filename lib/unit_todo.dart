import 'dart:async';

import 'package:fluttertodo/main.dart';

class TodoUnit {
  List<Todo> checkList = [];
  StreamController<List<Todo>> streamController = StreamController();

  TodoUnit() {
    streamController.stream.listen((List<Todo> newTodoSet) {
//      print(newTodoSet.length);
    });
  }

  addTodo(String task) {
    checkList.add(Todo(task: task, finished: false));
    _updateStream();
  }

  addTodoT(Todo todo) {
    checkList.add(todo);
    _updateStream();
  }

  removeTodo(int i) {
    if(i<checkList.length) {
      checkList.removeAt(i);
      _updateStream();
    }else{
//      throw Exception('Invalid index to remove todo item');
    }
  }

  _updateStream() {
    streamController.sink.add(checkList);
  }

  close() {
    streamController.sink.close();
    streamController.close();
  }
}
