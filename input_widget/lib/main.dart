import 'package:flutter/material.dart';
import 'package:input_widget/screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '입력 위젯',
      home: HomeScreen(),
    );
  }
}
