import 'package:fluttertodo/main.dart';
import 'package:fluttertodo/unit_todo.dart';
import 'package:test/test.dart';

void main() {
  group('Todo unit test group', () {
    final todoInstance = TodoUnit();
    Todo todo = Todo(task: 'Go corona', finished: false);

    test('check 0 on instantiation', () {

      expect(todoInstance.checkList.length, 0);

    });
    
    test('add one item by text', (){
      todoInstance.addTodo('Go Corona1');
      expect(todoInstance.checkList.length, 1);
    });

    test('add one item by instance', (){
      todoInstance.addTodoItem(todo);
      expect(todoInstance.checkList.length, 2);
    });

    test('add one more item by instance', (){
      todoInstance.addTodoItem(todo);
      expect(todoInstance.checkList.length, 3);
    });

    test('remove item at specific index', (){
      todoInstance.removeTodo(1);
      expect(todoInstance.checkList.length, 2);
    });

    test('remove item at invalid index', (){
      todoInstance.removeTodo(3);
      expect(todoInstance.checkList.length, 2);
    });

    test('close instance', (){
      todoInstance.close();
    });
  });
}
