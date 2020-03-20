import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Todo> checkList;

  const MyApp({Key key, this.checkList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo',
      home: TodoScreen(checkList: this.checkList),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: must_be_immutable
class TodoScreen extends StatefulWidget {
  List<Todo> checkList;

  TodoScreen({Key key, this.checkList}) {
    if (this.checkList == null || this.checkList.length == 0) {
      this.checkList = [];
    }
  }

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  StreamController<List<Todo>> _streamController = StreamController();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _streamController.sink.add(widget.checkList ?? <Todo>[]);
    super.initState();
  }

  @override
  void dispose() {
//    _textEditingController.dispose();
    _streamController.sink.close();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Todo'),
      ),
      body: StreamBuilder<List<Todo>>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? snapshot.data.length != 0
                    ? ListView.builder(
                        key: Key('todo_list'),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i) => CheckboxListTile(
                          title: Text(
                            snapshot.data[i].task,
                            key: ValueKey('item_${i}_text'),
                          ),
                          value: snapshot.data[i].finished,
                          onChanged: (bool value) {
                            widget.checkList[i].finished = value;
                            _streamController.sink.add(widget.checkList);
                          },
                        ),
                      )
                    : Center(
                        child: Text(
                          'It\'s kind lonely here',
                          key: Key('no_todos_message'),
                          style: Theme.of(context).textTheme.display1,
                        ),
                      )
                : Center(
                    child: Text('Oops! I am sorry, something is wrong',
                        style: Theme.of(context).textTheme.display1),
                  );
          }),
      floatingActionButton: FloatingActionButton(
        key: ValueKey('add_todo'),
        onPressed: _letsAddATodo,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _letsAddATodo({String initialValue}) async {
    if (initialValue != null) _textEditingController.text = initialValue;
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          margin: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Add your todo',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              TextField(
                key: Key('TF'),
                autofocus: true,
                controller: _textEditingController,
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  key: Key('add_todo_to_list_button'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    addThisTodo(_textEditingController.text);
                  },
                  child: Text(
                    'ADD',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
    return;
  }

  void addThisTodo(String task) {
    widget.checkList.add(Todo(task: task, finished: false));
    _textEditingController.text = "";
    _streamController.sink.add(widget.checkList);
  }
}

class Todo {
  String task;
  bool finished;

  Todo({this.task, this.finished});
}
