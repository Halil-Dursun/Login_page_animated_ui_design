import 'package:flutter/material.dart';
import 'package:ui_design1/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Lexend-R',
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
