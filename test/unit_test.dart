import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodo/main.dart';
import 'package:fluttertodo/unit_todo.dart';

void main() {
  test('Todo unit test', () {
    final todoEr = TodoUnit();
    Todo todo = Todo(task: 'Go corona', finished: false);

    expect(todoEr.checkList.length, 0);

    todoEr.addTodo('Go Corona1');
    expect(todoEr.checkList.length, 1);

    todoEr.addTodoT(todo);
    expect(todoEr.checkList.length, 2);

    todoEr.addTodoT(todo);
    expect(todoEr.checkList.length, 3);

    todoEr.removeTodo(1);
    expect(todoEr.checkList.length, 2);

    todoEr.close();

    todoEr.removeTodo(3);
    expect(todoEr.checkList.length, 2);
  });
}
