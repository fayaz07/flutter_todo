import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Todo integration test', () {
    final floatingActionButton = find.byValueKey('add_todo');
    final nothingHere = find.byValueKey('no_todos_message');
    final todoList = find.byType('StreamBuilder');
    final addButton = find.byValueKey('add_todo_to_list_button');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.setTextEntryEmulation(enabled: true);
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
      await driver.tap(floatingActionButton,
          timeout: Duration(milliseconds: 800));

      await driver.enterText("Go corona", timeout: Duration(seconds: 3));
      await driver.tap(addButton, timeout: Duration(seconds: 2));
      await driver.scrollUntilVisible(todoList, todoItem);

      expect(
        await driver.getText(todoItem),
        'Go corona',
      );
    });

    test('adding todo at 1', () async {
      final todoItem = find.byValueKey('item_1_text');
      await driver.tap(floatingActionButton,
          timeout: Duration(milliseconds: 800));

      await driver.enterText("corona go", timeout: Duration(seconds: 3));
      await driver.tap(addButton, timeout: Duration(seconds: 2));
      await driver.scrollUntilVisible(todoList, todoItem);

      expect(
        await driver.getText(todoItem),
        'corona go',
      );

      await driver.close();
      print('Integration tests succeeded');
    });
  }, timeout: Timeout(Duration(minutes: 4)));
}
