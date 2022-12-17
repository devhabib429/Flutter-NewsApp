import 'package:flutter/material.dart';
//import 'package:mysecond/homescreen.dart';
import 'package:mysecond/splashscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: splashscreen(),
    );
  }
}