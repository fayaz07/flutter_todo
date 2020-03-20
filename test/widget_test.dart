import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fluttertodo/main.dart';

void main() {
  testWidgets('Todo app test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(MaterialApp), findsOneWidget,
        reason: 'Searching for MaterialApp', skip: false);

    expect(find.byType(TodoScreen), findsOneWidget,
        reason: 'Searching for TodoScreen', skip: false);

    expect(find.byType(Scaffold), findsOneWidget,
        reason: 'Searching for Scaffold in TodoScreen', skip: false);

    expect(find.byType(AppBar), findsOneWidget,
        reason: 'Searching for Scaffold in TodoScreen', skip: false);

    expect(find.text("Flutter Todo"), findsOneWidget,
        reason: 'Searching for Appbar', skip: false);

    expect(find.byType(Center), findsNWidgets(3));

    expect(find.byType(Text), findsWidgets);

    await tester.pump();

    expect(find.text("It's kind lonely here"), findsOneWidget, reason: 'When there are no todos it must show this');

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(const Duration(milliseconds: 200));

    var textField = find.byType(TextField);

    await tester.showKeyboard(textField);

    expect(textField, findsOneWidget);

    await tester.enterText(textField, "Finish breakfast");
    var addButton = find.byType(FlatButton);

    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 200));

    expect(find.text("Finish breakfast"), findsOneWidget);

    var checkbox = find.byType(CheckboxListTile);
    expect(checkbox, findsOneWidget);

    await tester.tap(checkbox);
    await tester.pump();

    expect(checkbox, findsOneWidget);



    // checking for tapping down for 2 times

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle(const Duration(milliseconds: 200));

    await tester.showKeyboard(textField);

    expect(textField, findsOneWidget);

    await tester.enterText(textField, "Finish lunch");

    expect(addButton, findsOneWidget);

    await tester.tap(addButton);
    await tester.pumpAndSettle(const Duration(milliseconds: 200));

    expect(find.text("Finish lunch"), findsOneWidget);

    expect(checkbox, findsNWidgets(2));

  });


  testWidgets('Todo app test with arguments', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(checkList: [Todo(task: 'Go to office',finished: false)],));

    expect(find.byType(TodoScreen), findsOneWidget,
        reason: 'Searching for TodoScreen', skip: false);

    expect(find.byType(Scaffold), findsOneWidget,
        reason: 'Searching for Scaffold in TodoScreen', skip: false);

    expect(find.byType(AppBar), findsOneWidget,
        reason: 'Searching for Scaffold in TodoScreen', skip: false);

    expect(find.text("Flutter Todo"), findsOneWidget,
        reason: 'Searching for Appbar', skip: false);

    expect(find.byType(Center), findsNWidgets(3));

    expect(find.byType(Text), findsWidgets);

    await tester.pumpAndSettle();

    expect(find.text('Go to office'), findsOneWidget, reason: 'When there are no todos it must show this');

  });
}
