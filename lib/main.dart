import 'package:flutter/material.dart';
import 'package:narvanapp/future_screen.dart';
import 'package:narvanapp/stream_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const FutureScreen(),
      home: const StreamScreen(),
    );
  }
}
