import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {

  group('Todo integration test', () {
    final addTodoButton = find.byValueKey('add_todo');
    final nothingHere = find.byValueKey('no_todos_message');
    final todoList = find.byType('StreamBuilder');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts with no check lists', () async {
      expect(await driver.getText(nothingHere), "It's kind lonely here");
    });

    test('adding todo at 0', () async {
      final todoItem = find.byValueKey('item_0_text');
      await driver.tap(addTodoButton);

      final addButton = find.byValueKey('add_todo_to_list_button');

      // final textField = find.byValueKey('TF');
      await driver.enterText("Go corona",timeout: Duration(milliseconds: 100));
      await driver.tap(addButton);
      await driver.scrollUntilVisible(todoList, todoItem);

      expect(
        await driver.getText(todoItem),
        'Go corona',
      );
    });

    test('adding todo at 1', () async {
      final todoItem = find.byValueKey('item_1_text');
      await driver.tap(addTodoButton);

      final addButton = find.byValueKey('add_todo_to_list_button');

      await driver.enterText("corona go",timeout: Duration(milliseconds: 100));
      await driver.tap(addButton);
      await driver.scrollUntilVisible(todoList, todoItem);

      expect(
        await driver.getText(todoItem),
        'corona go',
      );
    });
  });
}
