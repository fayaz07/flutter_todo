<img src="https://miro.medium.com/max/937/1*PJd9d8vWMUv5notXiYSwJw.png"/>
Image source: Internet

[![Codemagic build status](https://api.codemagic.io/apps/5e7dc146c986422a4de60e73/5e7dc146c986422a4de60e72/status_badge.svg)](https://codemagic.io/apps/5e7dc146c986422a4de60e73/5e7dc146c986422a4de60e72/latest_build)

# flutter-todo

A flutter todo sample application demonstrating Flutter testing(Unit, Widget and Integration tests)



## Getting Started

### To run the tests

1. Clone the app
2. Run ``` flutter pub get ```
3. Run the following commands in terminal

#### Run Widget and Unit tests

```bash
flutter test
```

##### Log result of Unit, Widget tests
---
```bash
fayaz@hp:~/StudioProjects/flutter_todo$ flutter test
00:03 +9: All tests passed!
```


#### Run Integration tests

```bash
flutter drive --target=test_driver/app.dart
```

##### Log result of integration tests
---
```bash
fayaz@hp:~/StudioProjects/flutter_todo$ flutter drive --target=test_driver/app.dart
Using device Android SDK built for x86.
Starting application: test_driver/app.dart
Installing build/app/outputs/apk/app.apk...                         0.9s
Running Gradle task 'assembleDebug'...
Running Gradle task 'assembleDebug'... Done                         1.8s
✓ Built build/app/outputs/apk/debug/app-debug.apk.
D/FlutterActivity( 7656): Using the launch theme as normal theme.
D/FlutterActivityAndFragmentDelegate( 7656): Setting up FlutterEngine.
D/FlutterActivityAndFragmentDelegate( 7656): No preferred FlutterEngine was provided. Creating a new FlutterEngine for this
FlutterFragment.
D/FlutterActivityAndFragmentDelegate( 7656): Attaching FlutterEngine to the Activity that owns this Fragment.
D/FlutterView( 7656): Attaching to a FlutterEngine: io.flutter.embedding.engine.FlutterEngine@9f1d621
D/FlutterActivityAndFragmentDelegate( 7656): Executing Dart entrypoint: main, and sending initial route: /
I/flutter ( 7656): Observatory listening on http://127.0.0.1:41367/gXN3DZOrE6Q=/
00:00 +0: Todo integration test (setUpAll)

[info ] FlutterDriver: Connecting to Flutter application at http://127.0.0.1:37467/gXN3DZOrE6Q=/
[trace] FlutterDriver: Isolate found with number: 4503208257043767
[trace] FlutterDriver: Isolate is paused at start.
[trace] FlutterDriver: Attempting to resume isolate
[trace] FlutterDriver: Waiting for service extension
[info ] FlutterDriver: Connected to Flutter application.
00:01 +0: Todo integration test check flutter driver health

HealthStatus.ok

00:01 +1: Todo integration test starts with no check lists

00:01 +2: Todo integration test adding todo at 0

00:02 +3: Todo integration test adding todo at 1

Integration tests succeeded

00:10 +4: Todo integration test (tearDownAll)

00:10 +4: All tests passed!

Stopping application instance.

```

[Check demo here](integration_tests.webm)
